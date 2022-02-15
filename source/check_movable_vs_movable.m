function check_movable_vs_movable
%disp('check_movable_vs_movable')

global object_data
global collision_normal
global facepoint
global dt
global rotation_direction

%플레이어와 맵 오브젝트
for a = 1 : length(object_data.movable) - 1
    for b = a + 1 : length(object_data.movable)
     
    penetration = polygon_to_polygon(object_data.movable(a), object_data.movable(b));
    if penetration <= 0
        
        ra = facepoint - object_data.movable(a).position;
        rb = facepoint - object_data.movable(b).position;
        
        rv = object_data.movable(b).velocity - object_data.movable(a).velocity;
        velAlongNormal = rv * collision_normal';
        
        if velAlongNormal <= 0
            %충돌시 변화
            invMassSum = object_data.movable(a).invmass + object_data.movable(b).invmass;
            
            e = min(object_data.movable(a).restitution, object_data.movable(b).restitution);
            
            j = -(1 + e)*velAlongNormal; %impulse_norm
            j = j/invMassSum;
            
            impulse = j*collision_normal;
            
            %속도 변화
            object_data.movable(a).velocity = ...
                object_data.movable(a).velocity - object_data.movable(a).invmass*impulse;

            object_data.movable(b).velocity = ...
                object_data.movable(b).velocity + object_data.movable(b).invmass*impulse;
            
            %토크
            object_data.movable(a).angularVelocity = ...
                object_data.movable(a).angularVelocity - object_data.movable(a).invInertia*Cross(ra, impulse);

            if object_data.movable(b).invInertia*Cross(rb, impulse) < 0
                object_data.movable(b).angularVelocity = object_data.movable(b).angularVelocity - 0.3;
                rotation_direction = [-1 rotation_direction(1)];
                
            elseif object_data.movable(b).invInertia*Cross(rb, impulse) > 0
                object_data.movable(b).angularVelocity = object_data.movable(b).angularVelocity + 0.3;
                rotation_direction = [1 rotation_direction(1)];
            end
                
            if rotation_direction(1) == rotation_direction(2)
                object_data.movable(b).angularVelocity = ...
                object_data.movable(b).angularVelocity + object_data.movable(b).invInertia*Cross(rb, impulse);
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
            sf = (object_data.movable(a).static_friction^2 + object_data.movable(b).static_friction^2)^0.5;
            df = (object_data.movable(a).dynamic_friction^2 + object_data.movable(b).dynamic_friction^2)^0.5;
                
            if abs(jt) > 0
                if abs(jt) < j*sf
                    tangentImpulse = t * jt;
                else
                    tangentImpulse = t*-j*df;
                end
                
                object_data.movable(a).velocity = ...
                object_data.movable(a).velocity - object_data.movable(a).invmass*tangentImpulse;
            
                object_data.movable(b).velocity = ...
                object_data.movable(b).velocity + object_data.movable(b).invmass*tangentImpulse;
            end

        end
        
        
        %positionalCorrection
        percent = 0.2;
        correction = -penetration/(object_data.movable(a).invmass + object_data.movable(b).invmass)*percent*collision_normal;
        set(object_data.movable(b).patch,'Vertices',get(object_data.movable(b).patch,'Vertices')+correction*dt);
        object_data.movable(b).position = object_data.movable(b).position + correction*dt;
        
    end
    end
end