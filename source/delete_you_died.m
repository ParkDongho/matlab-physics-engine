function delete_you_died

global you_died;

delete(you_died.box);
delete(you_died.text1);
delete(you_died.text2);

you_died.drawed = false;