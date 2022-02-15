function menu_main
%disp('menu_main')
global h
global object;
global object_value;

global key

global ax_size


%% menu
global game_state;
global mainmenu;
global menu_bt_ready;


%%
if ~mainmenu.drawed
    set(h.a, 'xlim',[0 ax_size(3)])
    for i = 1 : 4
    mainmenu.menu(i).patch = patch(mainmenu.menu(i).x, mainmenu.menu(i).y, mainmenu.menu(i).color);
    mainmenu.menu(i).text = text((mainmenu.menu(i).x(1) + mainmenu.menu(i).x(2))/2, (mainmenu.menu(i).y(2) + mainmenu.menu(i).y(3))/2,mainmenu.menu(i).name,...
        'color',[1, 1, 1],...
        'fontweight','bold',...
        'fontsize',13,...
        'horizontalalignment', 'center');
    end
    mainmenu.drawed = true;
end


if key.Up.Ready && key.Up.Status && ~key.Down.Status && (mainmenu.num <= 3) && (1 <= mainmenu.num)
        set(mainmenu.menu(mainmenu.num).patch, 'FaceColor', [0 0 0]);
        mainmenu.num = mainmenu.num + 1;
        set(mainmenu.menu(mainmenu.num).patch, 'FaceColor', [1 0 0]);
        key.Up.Ready = false;
        
elseif key.Down.Ready && key.Down.Status && ~key.Up.Status && (mainmenu.num <= 4) && (2 <= mainmenu.num)
        set(mainmenu.menu(mainmenu.num).patch, 'FaceColor', [0 0 0]);
        mainmenu.num = mainmenu.num - 1;
        set(mainmenu.menu(mainmenu.num).patch, 'FaceColor', [1 0 0]);
        key.Down.Ready = false;

end
    
    
switch mainmenu.num
    case 4
        %Continue
        if key.OK.Ready && key.OK.Status
            delete_mainmenu();
            game_state = 1;
            
            key.OK.Ready = false;
        end
        
    case 3
        %NEW GAME
        if key.OK.Ready && key.OK.Status
            delete_mainmenu();
            game_state = 1;
            object_value.save(1).position = [10 32];
        
            
            
            key.OK.Ready = false;        
        end

    case 2
         %OPTION
        if key.OK.Ready && key.OK.Status
       
            
            
        
            key.OK.Ready = false;        
        end       

   
    case 1

        if key.OK.Ready && key.OK.Status
           stop(h.timer);
           close(h.f);
           close all;clc
        end
end