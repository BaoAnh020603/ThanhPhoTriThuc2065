/// @description Khởi tạo Màn chơi Trắc nghiệm (Screen 5 - Quiz Gameplay)
scr_init_game_data();
if (!instance_exists(obj_GameManager)) {
    instance_create_depth(0, 0, -1000, obj_GameManager);
}

city_idx = global.selected_city;
city_data = global.cities[city_idx];
q_index = 0;
total_q = array_length(city_data.questions);
correct_count = 0;
selected_option = -1;
answered = false;
quiz_finished = false;
reward_granted = false;
time_left = 45.0;
robot_msg = "Hãy chọn đáp án đúng nhé!";

// Tọa độ 4 ô đáp án A, B, C, D trên màn hình 1280x720
opt_x1 = [276, 754, 276, 754];
opt_y1 = [374, 374, 462, 462];
opt_x2 = [718, 1196, 718, 1196];
opt_y2 = [450, 450, 538, 538];
