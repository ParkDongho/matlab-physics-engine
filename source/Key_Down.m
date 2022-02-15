function Key_Down(~, eventdata, ~)
global h;
global object;
global object_value;

global key

%% Key_Down : ?��? ?�렸?????�행
key_pressed = eventdata.Key;

if strcmp(key_pressed, key.Left.Name)
        key.Left.Status = true;
        
elseif strcmp(key_pressed, key.Right.Name)
        key.Right.Status = true;
        
elseif strcmp(key_pressed, key.Up.Name)
        key.Up.Status = true;
        
elseif strcmp(key_pressed, key.Down.Name)
        key.Down.Status = true;
        
elseif strcmp(key_pressed, key.Jump.Name)
        key.Jump.Status = true;

elseif strcmp(key_pressed, key.Pause.Name)
        key.Pause.Status = true;
        
elseif strcmp(key_pressed, key.OK.Name)
        key.OK.Status = true;
        
end