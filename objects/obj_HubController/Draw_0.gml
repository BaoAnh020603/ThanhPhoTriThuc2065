/// @description Vẽ giao diện Sảnh nhân vật (Screen 2)
var mx = mouse_x;
var my = mouse_y;

// 1. Thanh thông tin người chơi góc trên trái
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_font(fnt_Heading);
draw_text_outlined(410, 44, global.player_name, c_white, make_color_rgb(12, 38, 85));

// Cấp độ & Thanh kinh nghiệm (XP)
draw_set_font(fnt_Heading);
draw_text_outlined(266, 118, "Lv." + string(global.player_level), make_color_rgb(255, 240, 130), make_color_rgb(95, 45, 5));

draw_set_font(fnt_Main);
draw_text_outlined(518, 118, string(global.player_xp) + " / " + string(global.player_xp_max), c_white, make_color_rgb(95, 45, 5));

// 2. Số Sao góc trên phải
draw_set_font(fnt_Heading);
draw_text_outlined(1096, 49, string(global.player_stars), make_color_rgb(255, 242, 135), make_color_rgb(20, 45, 95));

// 3. Hiệu ứng hover & Nhãn 4 nút chức năng bên phải
if (!global.show_mission_popup && global.active_modal == "") {
    if (point_in_box(mx, my, 896, 120, 1268, 238)) draw_hover_effect(896, 120, 1268, 238, 42, make_color_rgb(255, 225, 110));
    if (point_in_box(mx, my, 896, 246, 1268, 360)) draw_hover_effect(896, 246, 1268, 360, 42, make_color_rgb(110, 225, 255));
    if (point_in_box(mx, my, 896, 368, 1268, 482)) draw_hover_effect(896, 368, 1268, 482, 42, make_color_rgb(110, 225, 255));
    if (point_in_box(mx, my, 896, 490, 1268, 604)) draw_hover_effect(896, 490, 1268, 604, 42, make_color_rgb(110, 255, 200));
    if (point_in_box(mx, my, 42, 578, 758, 692))   draw_hover_effect(42, 578, 758, 692, 44, make_color_rgb(120, 230, 255));
}

draw_set_font(fnt_Heading);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_outlined(1138, 180, "Nhiệm vụ hôm nay", c_white, make_color_rgb(15, 42, 92));
draw_text_outlined(1138, 304, "Kho báu Tri thức", c_white, make_color_rgb(15, 42, 92));
draw_text_outlined(1138, 424, "Thành tích", c_white, make_color_rgb(15, 42, 92));
draw_text_outlined(1138, 546, "Trợ lý AI", c_white, make_color_rgb(15, 42, 92));

// 4. Thanh lời thoại nhân vật phía dưới
draw_set_font(fnt_Main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_outlined(456, 635, global.hub_speeches[global.hub_speech_index], 26, 525, c_white, make_color_rgb(12, 38, 82));

// 5. Nút điều hướng sang Bản đồ 6 Thành phố & Về Menu
draw_set_font(fnt_Body);
draw_pill_button(730, 20, 915, 76, "< Về Menu", make_color_rgb(25, 85, 175), make_color_rgb(120, 220, 255), (!global.show_mission_popup && global.active_modal == "" && point_in_box(mx, my, 730, 20, 915, 76)));

draw_set_font(fnt_Heading);
draw_pill_button(780, 618, 1264, 692, "Bản đồ 6 Thành phố >>", make_color_rgb(238, 128, 22), make_color_rgb(255, 240, 140), (!global.show_mission_popup && global.active_modal == "" && point_in_box(mx, my, 780, 618, 1264, 692)));

// 6. Vẽ Popup Nhiệm vụ (Screen 4) hoặc Modal nếu đang mở
scr_draw_mission_popup();
scr_draw_secondary_modal();

draw_set_halign(fa_left);
draw_set_valign(fa_top);
