/// @description Vẽ Bản đồ 6 Thành phố (Screen 3) và Popup Nhiệm vụ (Screen 4)
var mx = mouse_x;
var my = mouse_y;

// 1. HUD góc trên trái (Tên & Số Sao)
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_Small);
draw_text_outlined(278, 37, global.player_name, c_white, make_color_rgb(12, 38, 85));

draw_set_font(fnt_Main);
draw_text_outlined(253, 86, string(global.player_stars), make_color_rgb(255, 240, 125), make_color_rgb(20, 45, 95));

// Nút quay lại Sảnh nhân vật
draw_set_font(fnt_Body);
draw_pill_button(415, 18, 615, 70, "< Sảnh nhân vật", make_color_rgb(24, 88, 180), make_color_rgb(120, 225, 255), (!global.show_mission_popup && global.active_modal == "" && point_in_box(mx, my, 415, 18, 615, 70)));

// 2. Nhãn 3 nút góc trên phải: Quà tặng, Bảng xếp hạng, Trợ giúp
if (!global.show_mission_popup && global.active_modal == "") {
    if (point_in_box(mx, my, 876, 8, 986, 110))   draw_hover_effect(876, 8, 986, 110, 20, make_color_rgb(255, 230, 110));
    if (point_in_box(mx, my, 994, 8, 1142, 110))  draw_hover_effect(994, 8, 1142, 110, 20, make_color_rgb(255, 230, 110));
    if (point_in_box(mx, my, 1150, 8, 1258, 110)) draw_hover_effect(1150, 8, 1258, 110, 20, make_color_rgb(110, 225, 255));
}

draw_set_font(fnt_Small);
draw_text_outlined(931, 91, "Quà tặng", c_white, make_color_rgb(15, 40, 85));
draw_text_outlined(1068, 91, "Bảng xếp hạng", c_white, make_color_rgb(15, 40, 85));
draw_text_outlined(1205, 91, "Trợ giúp", c_white, make_color_rgb(15, 40, 85));

// 3. Vẽ tên 6 Đảo Thành phố trên bảng tên của từng đảo
for (var i = 0; i < 6; i++) {
    var cdata = global.cities[i];
    var is_hov = (!global.show_mission_popup && global.active_modal == "" && point_in_box(mx, my, island_x1[i], island_y1[i], island_x2[i], island_y2[i]));

    if (is_hov) {
        draw_hover_effect(island_x1[i], island_y1[i], island_x2[i], island_y2[i], 32, make_color_rgb(255, 240, 130));
    }

    draw_set_font((i == 4) ? fnt_Small : fnt_Body);
    var name_col = is_hov ? make_color_rgb(255, 245, 135) : c_white;
    draw_text_outlined(label_cx[i], label_cy[i], cdata.name, name_col, make_color_rgb(10, 35, 82));

    if (cdata.completed) {
        draw_set_font(fnt_Small);
        draw_text_outlined(label_cx[i], label_cy[i] - 32, "★ " + string(cdata.best_score) + "/5", make_color_rgb(120, 255, 150), make_color_rgb(10, 45, 20));
    }
}

// 4. Bảng thông báo góc dưới trái
draw_set_font(fnt_Body);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_outlined(306, 655, "Hoàn thành nhiệm vụ để xây dựng thành phố ngày càng hiện đại hơn nhé!", 22, 355, c_white, make_color_rgb(12, 38, 82));

// 5. Vẽ Popup Nhiệm vụ hôm nay (Screen 4) hoặc Modal phụ nếu đang mở
scr_draw_mission_popup();
scr_draw_secondary_modal();

draw_set_halign(fa_left);
draw_set_valign(fa_top);
