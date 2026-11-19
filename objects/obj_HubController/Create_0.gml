/// @description Khởi tạo Sảnh nhân vật (Screen 2 - Player Hub)
scr_init_game_data();
if (!instance_exists(obj_GameManager)) {
    instance_create_depth(0, 0, -1000, obj_GameManager);
}
