/// @description Khởi tạo Bản đồ 6 Thành phố (Screen 3 - World Map)
scr_init_game_data();
if (!instance_exists(obj_GameManager)) {
    instance_create_depth(0, 0, -1000, obj_GameManager);
}

// Tọa độ vùng bấm và tâm bảng tên của 6 đảo thành phố trên nền 1280x720
island_x1 = [135,  95, 460,  850, 495,  950];
island_y1 = [130, 370,  20,  105, 405,  335];
island_x2 = [415, 390, 735, 1140, 825, 1245];
island_y2 = [336, 572, 250,  326, 602,  572];

label_cx  = [301, 271, 617, 1018, 686, 1129];
label_cy  = [297, 531, 213,  287, 565,  531];
