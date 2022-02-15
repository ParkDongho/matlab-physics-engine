function menu_pause
global h
global key

global ax_size



%% menu
global game_state; %menu, play, gameover
global mainmenu;
global pausemenu;
global menubt_ready;



if ~pausemenu.drawed

    set(h.a, 'xlim',[0 ax_size(3)])
    for i = 1 : 4
    pausemenu.menu(i).patch = patch(pausemenu.menu(i).x, pausemenu.menu(i).y, pausemenu.menu(i).color);
    pausemenu.menu(i).text = text((pausemenu.menu(i).x(1)+pausemenu.menu(i).x(2))/2, (pausemenu.menu(i).y(2) + pausemenu.menu(i).y(3))/2,pausemenu.menu(i).name,...
        'color',[1, 1, 1],...
        'fontweight','bold',...
        'fontsize',13,...
        'horizontalalignment', 'center');
    end

    pausemenu.drawed = true;
end


    if key.Up.Ready && key.Up.Status && ~key.Down.Status && (pausemenu.num <= 3) && (1 <= pausemenu.num)
        set(pausemenu.menu(pausemenu.num).patch, 'FaceColor', [0 0 0]);
        pausemenu.num = pausemenu.num + 1;
        set(pausemenu.menu(pausemenu.num).patch, 'FaceColor', [1 0 0]);
        key.Up.Ready = false;
        
    elseif key.Down.Ready && key.Down.Status && ~key.Up.Status && (pausemenu.num <= 4) && (2 <= pausemenu.num)
        set(pausemenu.menu(pausemenu.num).patch, 'FaceColor', [0 0 0]);
        pausemenu.num = pausemenu.num - 1;
        set(pausemenu.menu(pausemenu.num).patch, 'FaceColor', [1 0 0]);
        key.Down.Ready = false;
    end
    
    
    switch pausemenu.num
    case 4
        %RESUME
        if key.OK.Ready && key.OK.Status

            game_state = 1;
 
            delete_pause_menu();            
            key.OK.Ready = false;
        end
        
    case 3
        %OPTION
        if key.OK.Ready && key.OK.Status

 
        
            key.OK.Ready = false;
        end
        
    case 2
        %MAINMENU
        if key.OK.Ready && key.OK.Status
            
            game_state = 0;
            delete_all_object()
            delete_pause_menu();
            key.OK.Ready = false;
        end
        
   
    case 1
        %QUIT
        if key.OK.Ready && key.OK.Status
            stop(h.timer);
            close(h.f);
            close all;clc
        end
    end
