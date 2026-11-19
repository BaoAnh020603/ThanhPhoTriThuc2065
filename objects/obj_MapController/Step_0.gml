/// @description Xử lý tương tác trên Bản đồ 6 Thành phố (Screen 3)
if (scr_step_secondary_modal()) exit;
if (scr_step_mission_popup()) exit;

var mx = mouse_x;
var my = mouse_y;

if (mouse_check_button_pressed(mb_left)) {
    // Nút quay lại Sảnh nhân vật (Avatar góc trên trái hoặc nút < Sảnh nhân vật)
    if (point_in_box(mx, my, 18, 8, 158, 138) || point_in_box(mx, my, 415, 18, 615, 70)) {
        room_goto(rm_hub);
        exit;
    }
    // Nút dấu + thêm Sao [295..345, 65..108]
    if (point_in_box(mx, my, 295, 65, 345, 108)) {
        global.active_modal = "gift";
        exit;
    }
    // 3 nút HUD góc trên phải: Quà tặng, Bảng xếp hạng, Trợ giúp
    if (point_in_box(mx, my, 876, 8, 986, 110)) {
        global.active_modal = "gift";
        exit;
    }
    if (point_in_box(mx, my, 994, 8, 1142, 110)) {
        global.active_modal = "leaderboard";
        exit;
    }
    if (point_in_box(mx, my, 1150, 8, 1258, 110)) {
        global.active_modal = "help";
        exit;
    }

    // Kiểm tra bấm vào 1 trong 6 Đảo Thành phố -> Mở Popup Nhiệm vụ (Screen 4)
    for (var i = 0; i < 6; i++) {
        if (point_in_box(mx, my, island_x1[i], island_y1[i], island_x2[i], island_y2[i])) {
            global.selected_city = i;
            global.show_mission_popup = true;
            exit;
        }
    }
}
