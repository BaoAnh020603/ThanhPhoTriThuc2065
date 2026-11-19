/// @description Khởi tạo màn hình Menu chính (Screen 1)
scr_init_game_data();
if (!instance_exists(obj_GameManager)) {
    instance_create_depth(0, 0, -1000, obj_GameManager);
}
