function delete_pause_menu
global pausemenu

for i = 1 : 4
	delete(pausemenu.menu(i).patch);
	delete(pausemenu.menu(i).text);
end


pausemenu.drawed = false;
pausemenu.num = 4;