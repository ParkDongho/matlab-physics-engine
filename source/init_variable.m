function init_variable
global h
global object;
global object_value;

global sc_size
global ax_size

global rotation_direction

global jumpable


%% KeyBoard input
global key

key.Left.Name = 'a';
key.Left.Status = false;
key.Left.Ready = true;

key.Right.Name = 'd';
key.Right.Status = false;
key.Right.Ready = true;

key.Up.Name = 'w';
key.Up.Status = false;
key.Up.Ready = true;

key.Down.Name = 's';
key.Down.Status = false;
key.Down.Ready = true;

key.Jump.Name = 'space';
key.Jump.Status = false;
key.Jump.Ready = true;

key.OK.Name = 'return';
key.OK.Status = false;
key.OK.Ready = true;

key.Pause.Name = 'escape';
key.Pause.Status = false;
key.Pause.Ready = true;


%% skill
global dash_time;
dash_time = 0;


%% menu
global game_state; %menu, play, gameover
global mainmenu;
global pausemenu;
global menu_bt_ready;
global you_died;
global game_clear;


game_state = 0;
menu_bt_ready = false;

mainmenu.num = 4;
mainmenu.drawed = false;
mainmenu.main_name = 'MAIN MENU';

mainmenu.menu(1).name = 'Quit';
mainmenu.menu(1).num = 1;
mainmenu.menu(1).drawed = false;
mainmenu.menu(1).x = [0.3 0.7 0.7 0.3].*ax_size(3);
mainmenu.menu(1).y = [0.25 0.25 0.35 0.35].*ax_size(4);
mainmenu.menu(1).color = [0 0 0];


mainmenu.menu(2).name = 'Option';
mainmenu.menu(2).num = 1;
mainmenu.menu(2).drawed = false;
mainmenu.menu(2).x = [0.3 0.7 0.7 0.3].*ax_size(3);
mainmenu.menu(2).y = [0.36 0.36 0.46 0.46].*ax_size(4);
mainmenu.menu(2).color = [0 0 0];

mainmenu.menu(3).name = 'New Game';
mainmenu.menu(3).num = 1;
mainmenu.menu(3).drawed = false;
mainmenu.menu(3).x = [0.3 0.7 0.7 0.3].*ax_size(3);
mainmenu.menu(3).y = [0.47 0.47 0.57 0.57].*ax_size(4);
mainmenu.menu(3).color = [0 0 0];

mainmenu.menu(4).name = 'Continue';
mainmenu.menu(4).num = 1;
mainmenu.menu(4).drawed = false;
mainmenu.menu(4).x = [0.3 0.7 0.7 0.3].*ax_size(3);
mainmenu.menu(4).y = [0.58 0.58 0.68 0.68].*ax_size(4);
mainmenu.menu(4).color = [1 0 0];



pausemenu.num = 4;
pausemenu.drawed = false;
pausemenu.main_name = 'Pause';

pausemenu.menu(1).name = 'Quit';
pausemenu.menu(1).num = 1;
pausemenu.menu(1).drawed = false;
pausemenu.menu(1).x = [0.3 0.7 0.7 0.3].*ax_size(3);
pausemenu.menu(1).y = [0.25 0.25 0.35 0.35].*ax_size(4);
pausemenu.menu(1).color = [0 0 0];


pausemenu.menu(2).name = 'Back to the Main menu';
pausemenu.menu(2).num = 1;
pausemenu.menu(2).drawed = false;
pausemenu.menu(2).x = [0.3 0.7 0.7 0.3].*ax_size(3);
pausemenu.menu(2).y = [0.36 0.36 0.46 0.46].*ax_size(4);
pausemenu.menu(2).color = [0 0 0];

pausemenu.menu(3).name = 'Option';
pausemenu.menu(3).num = 1;
pausemenu.menu(3).drawed = false;
pausemenu.menu(3).x = [0.3 0.7 0.7 0.3].*ax_size(3);
pausemenu.menu(3).y = [0.47 0.47 0.57 0.57].*ax_size(4);
pausemenu.menu(3).color = [0 0 0];

pausemenu.menu(4).name = 'Resume';
pausemenu.menu(4).num = 1;
pausemenu.menu(4).drawed = false;
pausemenu.menu(4).x = [0.3 0.7 0.7 0.3].*ax_size(3);
pausemenu.menu(4).y = [0.58 0.58 0.68 0.68].*ax_size(4);
pausemenu.menu(4).color = [1 0 0];


you_died.drawed = false;

game_clear.drawed = false;

rotation_direction = [0 0];


%% jump
jumpable = false;

