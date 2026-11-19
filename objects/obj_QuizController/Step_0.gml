/// @description Xử lý đếm ngược & chọn đáp án tại Màn chơi Trắc nghiệm (Screen 5)
var mx = mouse_x;
var my = mouse_y;

if (keyboard_check_pressed(vk_escape)) {
    room_goto(rm_map);
    exit;
}

// Nút "< Bản đồ" góc trên trái [18..142, 12..62]
if (mouse_check_button_pressed(mb_left) && point_in_box(mx, my, 18, 12, 142, 62)) {
    room_goto(rm_map);
    exit;
}

if (quiz_finished) {
    if (!reward_granted) {
        reward_granted = true;
        if (correct_count > global.cities[city_idx].best_score) {
            global.cities[city_idx].best_score = correct_count;
        }
        if (correct_count >= 4) {
            global.cities[city_idx].completed = true;
            scr_add_rewards(city_data.reward_stars, city_data.reward_xp);
        } else {
            scr_add_rewards(correct_count * 3, correct_count * 5);
        }
    }

    if (mouse_check_button_pressed(mb_left)) {
        // Nút "Chơi lại" [370..610, 495..560]
        if (point_in_box(mx, my, 370, 495, 610, 560)) {
            room_restart();
            exit;
        }
        // Nút "Về Bản đồ" [670..910, 495..560]
        if (point_in_box(mx, my, 670, 495, 910, 560)) {
            room_goto(rm_map);
            exit;
        }
    }
    exit;
}

// Đếm ngược thời gian mỗi câu
if (!answered) {
    time_left -= delta_time / 1000000.0;
    if (time_left <= 0) {
        time_left = 0;
        answered = true;
        selected_option = -1;
        var cur_q = city_data.questions[q_index];
        robot_msg = "Hết giờ rồi! " + cur_q.explain;
    }
}

if (mouse_check_button_pressed(mb_left)) {
    if (!answered) {
        var cur_q = city_data.questions[q_index];
        for (var i = 0; i < 4; i++) {
            if (point_in_box(mx, my, opt_x1[i], opt_y1[i], opt_x2[i], opt_y2[i])) {
                selected_option = i;
                answered = true;
                if (i == cur_q.ans) {
                    correct_count += 1;
                    scr_add_rewards(5, 5);
                    robot_msg = cur_q.explain;
                } else {
                    robot_msg = "Chưa chính xác! " + cur_q.explain;
                }
                exit;
            }
        }
    } else {
        // Bấm nút "Câu tiếp theo >>" [1020..1255, 582..652] hoặc bấm vào khung thoại Robot
        if (point_in_box(mx, my, 1020, 582, 1255, 652) || point_in_box(mx, my, 388, 568, 1012, 668)) {
            if (q_index + 1 < total_q) {
                q_index += 1;
                selected_option = -1;
                answered = false;
                time_left = 45.0;
                robot_msg = "Hãy chọn đáp án đúng nhé!";
            } else {
                quiz_finished = true;
            }
            exit;
        }
    }
}
