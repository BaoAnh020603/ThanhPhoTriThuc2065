/// @description Vẽ Màn chơi Trắc nghiệm (Screen 5 - Quiz Gameplay)
var mx = mouse_x;
var my = mouse_y;
var cur_q = city_data.questions[q_index];

// 1. Nút quay lại Bản đồ góc trên trái
draw_set_font(fnt_Body);
draw_pill_button(18, 12, 142, 62, "< Bản đồ", make_color_rgb(24, 88, 180), make_color_rgb(120, 225, 255), point_in_box(mx, my, 18, 12, 142, 62));

// 2. Đồng hồ đếm ngược (232, 41)
var secs = ceil(time_left);
var mins_str = "0" + string(secs div 60);
var secs_rem = secs mod 60;
var secs_str = (secs_rem < 10) ? ("0" + string(secs_rem)) : string(secs_rem);

draw_set_font(fnt_Heading);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var timer_col = (secs <= 10) ? make_color_rgb(255, 110, 110) : c_white;
draw_text_outlined(232, 41, mins_str + ":" + secs_str, timer_col, make_color_rgb(15, 42, 92));

// 3. Bộ đếm số câu hỏi: "Câu 1 / 5" (616, 40)
draw_text_outlined(616, 40, "Câu " + string(q_index + 1) + " / " + string(total_q), c_white, make_color_rgb(15, 42, 92));

// Tên thành phố hiện tại góc trên phải
draw_set_font(fnt_Body);
draw_text_outlined(1070, 82, city_data.name + "  |  Đúng: " + string(correct_count) + "/" + string(total_q), make_color_rgb(255, 240, 130), make_color_rgb(12, 35, 80));

// 4. Nội dung câu hỏi trong bảng lớn [270..1185, 125..330]
draw_set_font(fnt_Heading);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_outlined(725, 228, cur_q.q, 36, 870, c_white, make_color_rgb(12, 38, 85));

// 5. Vẽ 4 phương án trả lời A, B, C, D
draw_set_font(fnt_Main);
for (var i = 0; i < 4; i++) {
    var x1 = opt_x1[i];
    var y1 = opt_y1[i];
    var x2 = opt_x2[i];
    var y2 = opt_y2[i];
    var cx = (x1 + x2) * 0.5;
    var cy = (y1 + y2) * 0.5;

    if (!answered) {
        if (point_in_box(mx, my, x1, y1, x2, y2)) {
            draw_hover_effect(x1, y1, x2, y2, 36, make_color_rgb(255, 240, 120));
        }
    } else {
        if (i == cur_q.ans) {
            draw_hover_effect(x1, y1, x2, y2, 36, make_color_rgb(80, 255, 130));
        } else if (i == selected_option) {
            draw_hover_effect(x1, y1, x2, y2, 36, make_color_rgb(255, 95, 95));
        }
    }

    var txt_col = c_white;
    if (answered && i == cur_q.ans) txt_col = make_color_rgb(160, 255, 180);
    draw_text_outlined(cx, cy, cur_q.options[i], txt_col, make_color_rgb(12, 38, 85));
}

// 6. Bong bóng thoại của Robot AI bên dưới (706, 618)
draw_set_font(fnt_Main);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var msg_col = answered ? make_color_rgb(255, 245, 145) : c_white;
draw_text_ext_outlined(700, 618, robot_msg, 26, 580, msg_col, make_color_rgb(12, 38, 85));

// Nút "Câu tiếp theo >>" hoặc "Xem kết quả >>" khi đã chọn đáp án
if (answered && !quiz_finished) {
    var next_lbl = (q_index + 1 < total_q) ? "Câu tiếp >>" : "Kết quả >>";
    draw_set_font(fnt_Heading);
    draw_pill_button(1020, 582, 1255, 652, next_lbl, make_color_rgb(240, 130, 20), make_color_rgb(255, 240, 140), point_in_box(mx, my, 1020, 582, 1255, 652));
}

// 7. Bảng Tổng kết Hoàn thành Nhiệm vụ
if (quiz_finished) {
    draw_set_color(c_black);
    draw_set_alpha(0.75);
    draw_rectangle(0, 0, 1280, 720, false);

    draw_set_color(make_color_rgb(16, 48, 110));
    draw_set_alpha(0.96);
    draw_roundrect_ext(280, 120, 1000, 600, 36, 36, false);

    draw_set_color(make_color_rgb(255, 225, 100));
    draw_set_alpha(1.0);
    draw_roundrect_ext(280, 120, 1000, 600, 36, 36, true);
    draw_roundrect_ext(283, 123, 997, 597, 34, 34, true);

    draw_set_font(fnt_Title);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    var passed = (correct_count >= 4);
    draw_text_outlined(640, 185, passed ? "HOÀN THÀNH XUẤT SẮC!" : "KẾT QUẢ NHIỆM VỤ", make_color_rgb(255, 240, 120), make_color_rgb(120, 45, 5));

    draw_set_font(fnt_Heading);
    draw_text_outlined(640, 250, city_data.name, make_color_rgb(140, 240, 255), make_color_rgb(10, 35, 80));
    draw_text_outlined(640, 305, "Số câu trả lời đúng: " + string(correct_count) + " / " + string(total_q), c_white, make_color_rgb(10, 35, 80));

    draw_set_font(fnt_Main);
    if (passed) {
        draw_text_outlined(640, 365, "Phần thưởng: +" + string(city_data.reward_stars) + " Sao   |   +" + string(city_data.reward_xp) + " XP", make_color_rgb(255, 235, 110), make_color_rgb(10, 35, 80));
        draw_text_outlined(640, 415, "Đã mở khóa: " + city_data.badge_name + "!", make_color_rgb(120, 255, 155), make_color_rgb(10, 45, 25));
    } else {
        draw_text_outlined(640, 365, "Phần thưởng khuyến khích: +" + string(correct_count * 3) + " Sao   |   +" + string(correct_count * 5) + " XP", make_color_rgb(255, 235, 110), make_color_rgb(10, 35, 80));
        draw_text_outlined(640, 415, "Hãy trả lời đúng ít nhất 4/5 câu để nhận Huy hiệu nhé!", make_color_rgb(255, 200, 140), make_color_rgb(80, 25, 10));
    }

    draw_set_font(fnt_Heading);
    draw_pill_button(370, 495, 610, 560, "Chơi lại", make_color_rgb(28, 100, 195), make_color_rgb(130, 230, 255), point_in_box(mx, my, 370, 495, 610, 560));
    draw_pill_button(670, 495, 910, 560, "Về Bản đồ", make_color_rgb(240, 130, 20), make_color_rgb(255, 240, 130), point_in_box(mx, my, 670, 495, 910, 560));
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);
