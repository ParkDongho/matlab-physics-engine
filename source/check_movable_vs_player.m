function check_movable_vs_player
%disp('check_movable_vs_player');
global object_data
global collision_normal
global facepoint
global dt
global rotation_direction

global jumpable

%player & movable
for movable_index = 1 : length(object_data.movable)
    penetration = polygon_to_polygon(object_data.movable(movable_index), object_data.player);
    if penetration <= 0
        jumpable = true;
        ra = facepoint - object_data.movable(movable_index).position;
        rb = facepoint - object_data.player.position;
        
        rv = object_data.player.velocity - object_data.movable(movable_index).velocity;
        velAlongNormal = rv * collision_normal';
        
        if velAlongNormal <= 0
            %충돌시 변화
            invMassSum = object_data.movable(movable_index).invmass + object_data.player.invmass;
            
            e = min(object_data.movable(movable_index).restitution, object_data.player.restitution);
            
            j = -(1 + e)*velAlongNormal; %impulse_norm
            j = j/invMassSum;
            
            impulse = j*collision_normal;
            
            %속도 변화
            object_data.movable(movable_index).velocity = ...
                object_data.movable(movable_index).velocity - object_data.movable(movable_index).invmass*impulse;

            object_data.player.velocity = ...
                object_data.player.velocity + object_data.player.invmass*impulse;
            
            %토크
            object_data.movable(movable_index).angularVelocity = ...
                object_data.movable(movable_index).angularVelocity - object_data.movable(movable_index).invInertia*Cross(ra, impulse);

            if object_data.player.invInertia*Cross(rb, impulse) < 0
                object_data.player.angularVelocity = object_data.player.angularVelocity - 0.3;
                rotation_direction = [-1 rotation_direction(1)];
                
            elseif object_data.player.invInertia*Cross(rb, impulse) > 0
                object_data.player.angularVelocity = object_data.player.angularVelocity + 0.3;
                rotation_direction = [1 rotation_direction(1)];
            end
                
            if rotation_direction(1) == rotation_direction(2)
                object_data.player.angularVelocity = ...
                object_data.player.angularVelocity + object_data.player.invInertia*Cross(rb, impulse);
            end

            
            
            %마찰
            t = rv - (collision_normal*(rv*collision_normal'));
            
            if norm(t) == 0
                t = [0 0];
            else  
                t = t./norm(t); %normalization
            end
            
            jt = -rv*t';
            jt = jt / invMassSum;
            sf = (object_data.movable(movable_index).static_friction^2 + object_data.player.static_friction^2)^0.5;
            df = (object_data.movable(movable_index).dynamic_friction^2 + object_data.player.dynamic_friction^2)^0.5;
                
            if abs(jt) > 0
                if abs(jt) < j*sf
                    tangentImpulse = t * jt;
                else
                    tangentImpulse = t*-j*df;
                end
                
                object_data.movable(movable_index).velocity = ...
                object_data.movable(movable_index).velocity - object_data.movable(movable_index).invmass*tangentImpulse;
            
                object_data.player.velocity = ...
                object_data.player.velocity + object_data.player.invmass*tangentImpulse;
            end

        end
        
        
        %positionalCorrection
        percent = 0.2;
        correction = -penetration/(object_data.movable(movable_index).invmass + object_data.player.invmass)*percent*collision_normal;
        set(object_data.player.patch,'Vertices',get(object_data.player.patch,'Vertices')+correction*dt);
        object_data.player.position = object_data.player.position + correction*dt;
        
    end
end