function check_enemy_vs_map
%disp('check_enemy_vs_map')
global object_data
global collision_normal
global facepoint
global dt
global rotation_direction

%플레이어와 맵 오브젝트
for a = 1 : length(object_data.section(1).map)
    for b = 1 : length(object_data.enemy)
        
    penetration = polygon_to_polygon(object_data.section(1).map(a), object_data.enemy(b));
    if penetration <= 0
        
        ra = facepoint - object_data.section(1).map(a).position;
        rb = facepoint - object_data.enemy(b).position;
        
        rv = object_data.enemy(b).velocity - object_data.section(1).map(a).velocity;
        velAlongNormal = rv * collision_normal';
        
        if velAlongNormal <= 0
            %충돌시 변화
            invMassSum = object_data.section(1).map(a).invmass + object_data.enemy(b).invmass;
            
            e = min(object_data.section(1).map(a).restitution, object_data.enemy(b).restitution);
            
            j = -(1 + e)*velAlongNormal; %impulse_norm
            j = j/invMassSum;
            
            impulse = j*collision_normal;
            
            %속도 변화
            object_data.section(1).map(a).velocity = ...
                object_data.section(1).map(a).velocity - object_data.section(1).map(a).invmass*impulse;

            object_data.enemy(b).velocity = ...
                object_data.enemy(b).velocity + object_data.enemy(b).invmass*impulse;
            
            %토크
            object_data.section(1).map(a).angularVelocity = ...
                object_data.section(1).map(a).angularVelocity - object_data.section(1).map(a).invInertia*Cross(ra, impulse);

            if object_data.enemy(b).invInertia*Cross(rb, impulse) < 0
                object_data.enemy(b).angularVelocity = object_data.enemy(b).angularVelocity - 0.3;
                rotation_direction = [-1 rotation_direction(1)];
                
            elseif object_data.enemy(b).invInertia*Cross(rb, impulse) > 0
                object_data.enemy(b).angularVelocity = object_data.enemy(b).angularVelocity + 0.3;
                rotation_direction = [1 rotation_direction(1)];
            end
                
            if rotation_direction(1) == rotation_direction(2)
                object_data.enemy(b).angularVelocity = ...
                object_data.enemy(b).angularVelocity + object_data.enemy(b).invInertia*Cross(rb, impulse);
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
            sf = (object_data.section(1).map(a).static_friction^2 + object_data.enemy(b).static_friction^2)^0.5;
            df = (object_data.section(1).map(a).dynamic_friction^2 + object_data.enemy(b).dynamic_friction^2)^0.5;
                
            if abs(jt) > 0
                if abs(jt) < j*sf
                    tangentImpulse = t * jt;
                else
                    tangentImpulse = t*-j*df;
                end
                
                object_data.section(1).map(a).velocity = ...
                object_data.section(1).map(a).velocity - object_data.section(1).map(a).invmass*tangentImpulse;
            
                object_data.enemy(b).velocity = ...
                object_data.enemy(b).velocity + object_data.enemy(b).invmass*tangentImpulse;
            end

        end
        
        
        %positionalCorrection
        percent = 0.2;
        correction = -penetration/(object_data.section(1).map(a).invmass + object_data.enemy(b).invmass)*percent*collision_normal;
        set(object_data.enemy(b).patch,'Vertices',get(object_data.enemy(b).patch,'Vertices')+correction*dt);
        object_data.enemy(b).position = object_data.enemy(b).position + correction*dt;
        
    end
    end
end