function delete_game_clear

global game_clear;

delete(game_clear.box);
delete(game_clear.text1);
delete(game_clear.text2);

game_clear.drawed = false;