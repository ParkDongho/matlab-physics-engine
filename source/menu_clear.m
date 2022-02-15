function menu_clear
%disp('menu_clear')

global object_data
global key
global game_clear
global ax_size
global game_state

if ~game_clear.drawed
        game_clear.box = patch([0 ax_size(3) ax_size(3) 0] + object_data.player.position(1) -0.5 * ax_size(3),...
             [0 0 ax_size(4) ax_size(4)], [0 0 0]);
         
        game_clear.text1 = text(object_data.player.position(1), ax_size(4)/2,'CLEAR',...
            'color',[1, 0, 0],...
            'fontweight','bold',...
            'fontsize',ax_size(4)/2,...
            'horizontalalignment', 'center');
        
        game_clear.text2 = text(object_data.player.position(1), ax_size(4)/5,'Press esc',...
            'color',[1, 1, 1],...
            'fontweight','bold',...
            'fontsize',ax_size(4)/4,...
            'horizontalalignment', 'center');
        game_clear.drawed = true;
end


%To mainmenu
if key.Pause.Status && key.Pause.Ready
        delete_game_clear()
        delete_all_object()
        
        game_state = 0;
        
        key.Pause.Ready = false;
end