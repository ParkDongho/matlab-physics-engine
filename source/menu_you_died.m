function menu_you_died
%disp('menu_you_died')
global object_data;
global key;
global you_died


global ax_size;

global game_state;

if ~you_died.drawed
        you_died.box = patch([0 ax_size(3) ax_size(3) 0] + object_data.player.position(1) -0.5 * ax_size(3),...
             [0 0 ax_size(4) ax_size(4)], [0 0 0]);
         
        you_died.text1 = text(object_data.player.position(1), ax_size(4)/2,'YOU DIED',...
            'color',[1, 0, 0],...
            'fontweight','bold',...
            'fontsize',ax_size(4)/2,...
            'horizontalalignment', 'center');
        
        you_died.text2 = text(object_data.player.position(1), ax_size(4)/5,'Press esc',...
            'color',[1, 1, 1],...
            'fontweight','bold',...
            'fontsize',ax_size(4)/4,...
            'horizontalalignment', 'center');
        you_died.drawed = true;
end


%To mainmenu
if key.Pause.Status && key.Pause.Ready
        delete_you_died()
        delete_all_object()
        
        game_state = 0;
        
        key.Pause.Ready = false;
end
