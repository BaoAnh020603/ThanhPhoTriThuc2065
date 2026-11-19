/// @description Vẽ chữ sắc nét và hiệu ứng nút trên Menu chính (Screen 1)
var mx = mouse_x;
var my = mouse_y;

// Hiệu ứng sáng khi di chuột vào 4 nút chính
if (global.active_modal == "") {
    if (point_in_box(mx, my, 816, 376, 1244, 478)) {
        draw_hover_effect(816, 376, 1244, 478, 48, make_color_rgb(255, 235, 110));
    }
    if (point_in_box(mx, my, 930, 490, 1188, 558)) {
        draw_hover_effect(930, 490, 1188, 558, 32, make_color_rgb(110, 225, 255));
    }
    if (point_in_box(mx, my, 930, 562, 1188, 630)) {
        draw_hover_effect(930, 562, 1188, 630, 32, make_color_rgb(110, 225, 255));
    }
    if (point_in_box(mx, my, 930, 634, 1188, 702)) {
        draw_hover_effect(930, 634, 1188, 702, 32, make_color_rgb(255, 150, 150));
    }
}

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Nhãn nút "Bắt đầu chơi"
draw_set_font(fnt_Title);
draw_text_outlined(1075, 426, "Bắt đầu chơi", c_white, make_color_rgb(135, 50, 5));

// Nhãn 3 nút phụ
draw_set_font(fnt_Heading);
draw_text_outlined(1082, 524, "Thành tích", c_white, make_color_rgb(15, 45, 95));
draw_text_outlined(1082, 596, "Cài đặt", c_white, make_color_rgb(15, 45, 95));
draw_text_outlined(1082, 668, "Thoát game", c_white, make_color_rgb(115, 20, 30));

// Nút truy cập nhanh Bản đồ góc trên phải
draw_set_font(fnt_Body);
draw_pill_button(1045, 18, 1262, 66, "Bản đồ 6 TP >>", make_color_rgb(24, 92, 185), make_color_rgb(120, 225, 255), point_in_box(mx, my, 1045, 18, 1262, 66));

// Vẽ Modal nếu đang mở
scr_draw_secondary_modal();

draw_set_halign(fa_left);
draw_set_valign(fa_top);
