function delete_mainmenu
global mainmenu

for i = 1 : 4
    delete(mainmenu.menu(i).patch)
    delete(mainmenu.menu(i).text)
end
mainmenu.drawed = false;
mainmenu.num = 4;
