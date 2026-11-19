/// @description Phím tắt chuyển nhanh màn hình (F1..F4)
if (keyboard_check_pressed(vk_f1)) {
    global.active_modal = "";
    global.show_mission_popup = false;
    room_goto(rm_menu);
}
if (keyboard_check_pressed(vk_f2)) {
    global.active_modal = "";
    global.show_mission_popup = false;
    room_goto(rm_hub);
}
if (keyboard_check_pressed(vk_f3)) {
    global.active_modal = "";
    global.show_mission_popup = false;
    room_goto(rm_map);
}
if (keyboard_check_pressed(vk_f4)) {
    global.active_modal = "";
    global.show_mission_popup = false;
    room_goto(rm_quiz);
}
