function Key_Up(hObject, eventdata, h)
global h;
global object;
global object_value;
global key

%% KeyBoard input
global LeftKeyName;
global RightKeyName;
global UpKeyName;
global DownKeyName;
global JumpKeyName;

global PauseKeyName;

global LeftKeyStatus
global RightKeyStatus
global UpKeyStatus
global DownKeyStatus
global JumpKeyStatus;

global PauseKeyStatus

%% Key_Up : ?¤ê? ?Œì¡Œ?????¤í–‰

key_pressed = eventdata.Key;

if strcmp(key_pressed, key.Left.Name)
        key.Left.one_push = false;
        key.Left.Status = false;


elseif strcmp(key_pressed, key.Right.Name)
        key.Right.one_push = false;
        key.Right.Status = false;

        
elseif strcmp(key_pressed, key.Up.Name)
        key.Up.one_push = false;
        key.Up.Status = false;

        
elseif strcmp(key_pressed, key.Down.Name)
        key.Down.one_push = false;
        key.Down.Status = false;

        
elseif strcmp(key_pressed, key.Jump.Name)
        key.Jump.one_push = false;
        key.Jump.Status = false;

elseif strcmp(key_pressed, key.Pause.Name)
        key.Pause.one_push = false;
        key.Pause.Status = false;
        
elseif strcmp(key_pressed, key.OK.Name)
        key.OK.one_push = false;
        key.OK.Status = false;
        
        
end