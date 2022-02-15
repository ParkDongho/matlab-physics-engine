function animation(varargin)
global gage
gage = gage + 1;




global h;
global object;
global object_value;

global sc_size;
global ax_size;

global LeftKeyStatus;
global RightKeyStatus;
global UpKeyStatus;
global DownKeyStatus;
global JumpKeyStatus;

global PauseKeyStatus;
global dash_time;

global game_state

global mainmenu;
global up_ready;
global down_ready;

global key

%% game_state
switch game_state
    case 0
        menu_main();
        
    case 1
        main_game();
    
        if key.Pause.Status && key.Pause.Ready
            game_state = 3;
        end
        
    case 2
        menu_you_died();
        
    case 3
        menu_pause();
        
    case 4
        menu_clear();
        
end
        

%% key_ready_check
Key_check()
