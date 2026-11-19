/// @description Xử lý tương tác chuột tại Menu chính
if (scr_step_secondary_modal()) exit;

var mx = mouse_x;
var my = mouse_y;

if (mouse_check_button_pressed(mb_left)) {
    // 1. Nút "Bắt đầu chơi" [816..1244, 376..478]
    if (point_in_box(mx, my, 816, 376, 1244, 478)) {
        room_goto(rm_hub);
        exit;
    }
    // 2. Nút "Thành tích" [930..1188, 490..558]
    if (point_in_box(mx, my, 930, 490, 1188, 558)) {
        global.active_modal = "achievements";
        exit;
    }
    // 3. Nút "Cài đặt" [930..1188, 562..630]
    if (point_in_box(mx, my, 930, 562, 1188, 630)) {
        global.active_modal = "settings";
        exit;
    }
    // 4. Nút "Thoát game" [930..1188, 634..702]
    if (point_in_box(mx, my, 930, 634, 1188, 702)) {
        game_end();
        exit;
    }
    // Nút vào nhanh Bản đồ góc trên phải [1045..1262, 18..66]
    if (point_in_box(mx, my, 1045, 18, 1262, 66)) {
        room_goto(rm_map);
        exit;
    }
}
