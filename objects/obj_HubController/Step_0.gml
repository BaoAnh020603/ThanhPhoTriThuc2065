/// @description Xử lý tương tác tại Sảnh nhân vật (Screen 2)
if (scr_step_secondary_modal()) exit;
if (scr_step_mission_popup()) exit;

var mx = mouse_x;
var my = mouse_y;

if (mouse_check_button_pressed(mb_left)) {
    // 1. Nút "Nhiệm vụ hôm nay" [896..1268, 120..238]
    if (point_in_box(mx, my, 896, 120, 1268, 238)) {
        global.show_mission_popup = true;
        exit;
    }
    // 2. Nút "Kho báu Tri thức" [896..1268, 246..360]
    if (point_in_box(mx, my, 896, 246, 1268, 360)) {
        global.active_modal = "treasure";
        exit;
    }
    // 3. Nút "Thành tích" [896..1268, 368..482]
    if (point_in_box(mx, my, 896, 368, 1268, 482)) {
        global.active_modal = "achievements";
        exit;
    }
    // 4. Nút "Trợ lý AI" [896..1268, 490..604]
    if (point_in_box(mx, my, 896, 490, 1268, 604)) {
        global.active_modal = "ai_helper";
        exit;
    }
    // Nút Loa / Thanh thoại dưới đáy [42..758, 578..692] -> Đổi câu thoại
    if (point_in_box(mx, my, 42, 578, 758, 692)) {
        global.hub_speech_index = (global.hub_speech_index + 1) mod array_length(global.hub_speeches);
        exit;
    }
    // Nút dấu + nhận thêm Sao [1170..1248, 18..82]
    if (point_in_box(mx, my, 1170, 18, 1248, 82)) {
        global.active_modal = "gift";
        exit;
    }
    // Nút sang Bản đồ 6 Thành phố [780..1264, 618..692]
    if (point_in_box(mx, my, 780, 618, 1264, 692)) {
        room_goto(rm_map);
        exit;
    }
    // Nút quay về Menu chính [730..915, 20..76]
    if (point_in_box(mx, my, 730, 20, 915, 76)) {
        room_goto(rm_menu);
        exit;
    }
}
