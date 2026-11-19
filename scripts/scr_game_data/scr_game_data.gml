/// @function scr_init_game_data()
/// @description Khởi tạo dữ liệu toàn cục cho game "Thành phố Tri thức 2065"
function scr_init_game_data() {
    if (variable_global_exists("game_initialized") && global.game_initialized) {
        return;
    }
    global.game_initialized = true;

    // Thông tin người chơi
    global.player_name = "Minh Khám phá gia";
    global.player_level = 1;
    global.player_xp = 20;
    global.player_xp_max = 100;
    global.player_stars = 120;

    // Trạng thái điều hướng & popup
    global.selected_city = 0;
    global.show_mission_popup = false;
    global.active_modal = ""; // "", "achievements", "treasure", "ai_helper", "gift", "leaderboard", "help", "settings"
    global.daily_gift_claimed = false;
    global.sound_enabled = true;
    global.music_enabled = true;
    global.ai_tip_index = 0;
    global.treasure_page = 0;

    // Câu thoại tại Sảnh nhân vật (Hub)
    global.hub_speeches = [
        "Cùng mình khám phá Thành phố Tri thức 2065 nhé!",
        "Đồng Nai năm 2065 là siêu đô thị thông minh, xanh và hiện đại!",
        "Hoàn thành nhiệm vụ ở 6 thành phố để sưu tầm trọn bộ Huy hiệu Tri thức!",
        "Nhấn vào 'Nhiệm vụ hôm nay' hoặc 'Bản đồ' để bắt đầu hành trình nhé!"
    ];
    global.hub_speech_index = 0;

    // Lời khuyên của Trợ lý AI
    global.ai_tips = [
        "Mẹo Toán học: Khi nhân một số với 4, bạn có thể nhân đôi số đó hai lần liên tiếp! Ví dụ: 25 x 2 = 50, 50 x 2 = 100.",
        "Kiến thức Đồng Nai 2065: Cảng hàng không quốc tế Long Thành là cửa ngõ giao thương hàng không hiện đại bậc nhất khu vực!",
        "Mẹo Khoa học & Xanh: Năng lượng mặt trời và năng lượng gió không tạo ra khí thải nhà kính, giúp bảo vệ Trái Đất xanh sạch.",
        "Kỹ năng AI 2065: Trí tuệ nhân tạo (AI) giúp điều phối giao thông thông minh, hỗ trợ y tế và cá nhân hóa việc học tập mỗi ngày!"
    ];

    // Dữ liệu 6 Thành phố Tri thức (mỗi thành phố gồm 5 câu hỏi trắc nghiệm)
    global.cities = [
        // 0: Thành phố Toán học
        {
            id: 0,
            name: "Thành phố Toán học",
            badge_name: "Huy hiệu Toán học",
            desc: "Hãy giúp thành phố giải mã bài toán để mở khóa cánh cổng tri thức nhé!",
            missions: [
                "Giải 5 bài toán tính nhẩm",
                "Trả lời đúng ít nhất 4 câu",
                "Thời gian: 3 phút"
            ],
            reward_stars: 20,
            reward_xp: 30,
            completed: false,
            best_score: 0,
            treasure_title: "Bí mật Toán học Đô thị 2065",
            treasure_fact: "Mọi tòa nhà chọc trời và mạng lưới tàu điện ngầm tại Thành phố Tri thức 2065 đều được thiết kế bằng các thuật toán hình học và tối ưu hóa năng lượng chính xác đến từng mi-li-mét!",
            questions: [
                {
                    q: "Một trạm năng lượng mặt trời tạo ra 25 đơn vị điện mỗi giờ. Hỏi trong 4 giờ trạm tạo ra bao nhiêu đơn vị điện?",
                    options: ["A. 80", "B. 90", "C. 100", "D. 120"],
                    ans: 2,
                    explain: "Chính xác! 25 x 4 = 100 đơn vị điện."
                },
                {
                    q: "Tàu điện trên không chở 45 hành khách ở toa đầu và 38 hành khách ở toa sau. Hỏi cả hai toa có bao nhiêu hành khách?",
                    options: ["A. 73", "B. 83", "C. 85", "D. 93"],
                    ans: 1,
                    explain: "Tuyệt vời! 45 + 38 = 83 hành khách."
                },
                {
                    q: "Vườn ươm thông minh trồng 6 hàng cây xanh, mỗi hàng có 15 cây. Hỏi vườn ươm có tất cả bao nhiêu cây xanh?",
                    options: ["A. 75", "B. 80", "C. 90", "D. 96"],
                    ans: 2,
                    explain: "Đúng rồi! 6 x 15 = 90 cây xanh."
                },
                {
                    q: "Thư viện số có 120 quyển sách khoa học, chia đều vào 4 kệ thông minh. Hỏi mỗi kệ có bao nhiêu quyển sách?",
                    options: ["A. 25", "B. 30", "C. 35", "D. 40"],
                    ans: 1,
                    explain: "Xuất sắc! 120 : 4 = 30 quyển sách mỗi kệ."
                },
                {
                    q: "Một robot giao hàng tự hành đi được 18 km mỗi giờ. Trong 3 giờ liên tục, robot đi được quãng đường bao nhiêu ki-lô-mét?",
                    options: ["A. 48 km", "B. 52 km", "C. 54 km", "D. 60 km"],
                    ans: 2,
                    explain: "Chính xác! 18 x 3 = 54 km."
                }
            ]
        },

        // 1: Vương quốc Ngôn ngữ
        {
            id: 1,
            name: "Vương quốc Ngôn ngữ",
            badge_name: "Huy hiệu Ngôn ngữ",
            desc: "Khám phá kho tàng tiếng Việt phong phú và cầu nối ngoại ngữ quốc tế của công dân toàn cầu!",
            missions: [
                "Vượt qua 5 thử thách từ vựng",
                "Trả lời đúng ít nhất 4 câu",
                "Thời gian: 3 phút"
            ],
            reward_stars: 20,
            reward_xp: 30,
            completed: false,
            best_score: 0,
            treasure_title: "Ngôn ngữ & Giao lưu Quốc tế",
            treasure_fact: "Công dân Thành phố Tri thức 2065 vừa gìn giữ sự trong sáng của tiếng Việt, vừa thông thạo ngoại ngữ và ngôn ngữ lập trình để kết nối với bạn bè khắp năm châu!",
            questions: [
                {
                    q: "Từ nào dưới đây viết ĐÚNG chính tả tiếng Việt?",
                    options: ["A. Sáng kiến", "B. Xáng kiến", "C. Sáng kiếng", "D. Xáng kiếng"],
                    ans: 0,
                    explain: "Chính xác! 'Sáng kiến' là cách viết đúng chính tả."
                },
                {
                    q: "Câu tục ngữ 'Đi một ngày đàng, học một sàng khôn' khuyên chúng ta điều gì?",
                    options: ["A. Nên đi bộ thật nhanh", "B. Chăm chỉ đi xa, trải nghiệm để mở mang tri thức", "C. Nên mua nhiều sàng", "D. Chỉ học ở trong nhà"],
                    ans: 1,
                    explain: "Đúng rồi! Đi nhiều nơi và khám phá giúp ta học hỏi thêm nhiều điều hay."
                },
                {
                    q: "Trong tiếng Anh, cụm từ 'Smart City' có nghĩa tiếng Việt là gì?",
                    options: ["A. Thành phố cổ kính", "B. Thành phố thông minh", "C. Nông trại vui vẻ", "D. Trạm vũ trụ"],
                    ans: 1,
                    explain: "Tuyệt vời! 'Smart City' nghĩa là Thành phố thông minh."
                },
                {
                    q: "Từ nào đồng nghĩa với từ 'Siêng năng'?",
                    options: ["A. Lười biếng", "B. Chăm chỉ", "C. Chậm chạp", "D. Vội vàng"],
                    ans: 1,
                    explain: "Chính xác! 'Chăm chỉ', 'cần cù' đồng nghĩa với 'siêng năng'."
                },
                {
                    q: "Điền từ thích hợp vào câu: 'Học tập thông minh - ... tương lai'?",
                    options: ["A. Khám phá", "B. Ngủ quên", "C. Bỏ qua", "D. Chờ đợi"],
                    ans: 0,
                    explain: "Xuất sắc! Khẩu hiệu của chúng ta là 'Học tập thông minh - Khám phá tương lai'."
                }
            ]
        },

        // 2: Thành phố Khoa học
        {
            id: 2,
            name: "Thành phố Khoa học",
            badge_name: "Huy hiệu Khoa học",
            desc: "Thực hiện các thí nghiệm kỳ thú về vũ trụ, vật lý và công nghệ năng lượng sạch tương lai!",
            missions: [
                "Giải mã 5 hiện tượng khoa học",
                "Trả lời đúng ít nhất 4 câu",
                "Thời gian: 3 phút"
            ],
            reward_stars: 20,
            reward_xp: 30,
            completed: false,
            best_score: 0,
            treasure_title: "Trung tâm Nghiên cứu Khoa học 2065",
            treasure_fact: "Các phòng thí nghiệm tại Thành phố Khoa học ứng dụng công nghệ vật liệu siêu dẫn và quang hợp nhân tạo, biến ánh nắng mặt trời thành nguồn năng lượng vô tận!",
            questions: [
                {
                    q: "Nguồn năng lượng nào sau đây là năng lượng sạch và tái tạo được?",
                    options: ["A. Than đá", "B. Dầu mỏ", "C. Năng lượng mặt trời", "D. Khí đốt hóa thạch"],
                    ans: 2,
                    explain: "Chính xác! Năng lượng mặt trời là năng lượng tái tạo xanh và sạch."
                },
                {
                    q: "Hành tinh nào được mệnh danh là 'Hành tinh Xanh' - ngôi nhà của sự sống chúng ta?",
                    options: ["A. Sao Hỏa", "B. Trái Đất", "C. Sao Mộc", "D. Sao Kim"],
                    ans: 1,
                    explain: "Đúng rồi! Trái Đất là Hành tinh Xanh của chúng ta."
                },
                {
                    q: "Ở điều kiện tiêu chuẩn, nước tinh khiết sôi ở nhiệt độ bao nhiêu độ C?",
                    options: ["A. 50 độ C", "B. 80 độ C", "C. 100 độ C", "D. 150 độ C"],
                    ans: 2,
                    explain: "Tuyệt vời! Nước sôi ở 100 độ C."
                },
                {
                    q: "Bộ phận nào của cây xanh thực hiện quá trình quang hợp tạo ra khí Ô-xy?",
                    options: ["A. Lá cây", "B. Rễ cây", "C. Hạt giống", "D. Vỏ cây khô"],
                    ans: 0,
                    explain: "Chính xác! Lá cây chứa chất diệp lục giúp quang hợp dưới ánh sáng mặt trời."
                },
                {
                    q: "Lực nào giữ cho con người và vạn vật đứng vững trên bề mặt Trái Đất?",
                    options: ["A. Lực đẩy Ác-si-mét", "B. Lực hấp dẫn (Trọng lực)", "C. Lực gió", "D. Lực đàn hồi"],
                    ans: 1,
                    explain: "Xuất sắc! Lực hấp dẫn của Trái Đất giữ mọi vật trên mặt đất."
                }
            ]
        },

        // 3: Thành phố Xanh
        {
            id: 3,
            name: "Thành phố Xanh",
            badge_name: "Huy hiệu Môi trường",
            desc: "Chung tay bảo vệ rừng sinh thái, phân loại rác thông minh và xây dựng đô thị không khói bụi!",
            missions: [
                "Hoàn thành 5 thử thách sống xanh",
                "Trả lời đúng ít nhất 4 câu",
                "Thời gian: 3 phút"
            ],
            reward_stars: 20,
            reward_xp: 30,
            completed: false,
            best_score: 0,
            treasure_title: "Lá phổi Sinh thái Đồng Nai",
            treasure_fact: "Khu dự trữ sinh quyển thế giới Cát Tiên và hồ Trị An là lá phổi xanh quý giá của vùng Đông Nam Bộ, nơi bảo tồn hàng ngàn loài động thực vật quý hiếm!",
            questions: [
                {
                    q: "Hành động nào sau đây giúp bảo vệ môi trường tại Thành phố Xanh?",
                    options: ["A. Xả rác bừa bãi", "B. Phân loại rác tại nguồn và tái chế", "C. Đốt túi ni-lông", "D. Lãng phí nước sạch"],
                    ans: 1,
                    explain: "Chính xác! Phân loại rác và tái chế giúp giảm ô nhiễm môi trường."
                },
                {
                    q: "Vườn quốc gia nổi tiếng nào nằm trên địa bàn tỉnh Đồng Nai được UNESCO công nhận là Khu dự trữ sinh quyển thế giới?",
                    options: ["A. Vườn quốc gia Cát Tiên", "B. Vườn quốc gia Cúc Phương", "C. Vườn quốc gia Phong Nha", "D. Vườn quốc gia Ba Vì"],
                    ans: 0,
                    explain: "Tuyệt vời! Vườn quốc gia Cát Tiên là niềm tự hào sinh thái của Đồng Nai."
                },
                {
                    q: "Nguyên tắc 3R trong bảo vệ môi trường bao gồm: Reduce (Giảm thiểu), Reuse (Tái sử dụng) và gì nữa?",
                    options: ["A. Recycle (Tái chế)", "B. Remove (Vứt bỏ)", "C. Run (Chạy nhanh)", "D. Repeat (Lặp lại)"],
                    ans: 0,
                    explain: "Đúng rồi! 3R là Reduce - Reuse - Recycle (Giảm thiểu - Tái sử dụng - Tái chế)."
                },
                {
                    q: "Phương tiện giao thông nào thân thiện nhất với môi trường đô thị?",
                    options: ["A. Xe chạy xăng cũ khói đen", "B. Tàu điện và xe đạp công cộng", "C. Xe tải hạng nặng", "D. Tàu chạy than đá"],
                    ans: 1,
                    explain: "Chính xác! Tàu điện và xe đạp không phát thải khói bụi độc hại."
                },
                {
                    q: "Trồng nhiều cây xanh trong thành phố mang lại lợi ích gì?",
                    options: ["A. Hấp thụ khí CO2, tỏa bóng mát và tạo khí Ô-xy", "B. Làm thành phố nóng hơn", "C. Tốn diện tích vô ích", "D. Gây tiếng ồn"],
                    ans: 0,
                    explain: "Xuất sắc! Cây xanh là máy lọc không khí tự nhiên tuyệt vời nhất."
                }
            ]
        },

        // 4: Thành phố Lịch sử - Văn hóa
        {
            id: 4,
            name: "Thành phố Lịch sử - Văn hóa",
            badge_name: "Huy hiệu Văn hóa",
            desc: "Tìm hiểu truyền thống hào hùng của vùng đất Biên Hòa - Đồng Nai và văn hóa dân tộc Việt Nam!",
            missions: [
                "Trả lời 5 câu hỏi Lịch sử - Văn hóa",
                "Trả lời đúng ít nhất 4 câu",
                "Thời gian: 3 phút"
            ],
            reward_stars: 20,
            reward_xp: 30,
            completed: false,
            best_score: 0,
            treasure_title: "Hào khí Đồng Nai vươn tầm",
            treasure_fact: "Văn miếu Trấn Biên (xây dựng năm 1715) là văn miếu đầu tiên ở phương Nam, biểu tượng cho truyền thống hiếu học, trọng nhân tài của vùng đất Biên Hòa - Đồng Nai!",
            questions: [
                {
                    q: "Di tích lịch sử nào tại Biên Hòa - Đồng Nai được mệnh danh là Văn miếu đầu tiên của vùng đất phương Nam?",
                    options: ["A. Văn miếu Trấn Biên", "B. Chùa Một Cột", "C. Tháp Chăm", "D. Thành Cổ Loa"],
                    ans: 0,
                    explain: "Chính xác! Văn miếu Trấn Biên là biểu tượng văn hóa - hiếu học của Đồng Nai."
                },
                {
                    q: "Dự án Cảng hàng không quốc tế quy mô lớn bậc nhất Việt Nam đang phát triển tại tỉnh Đồng Nai có tên là gì?",
                    options: ["A. Sân bay Nội Bài", "B. Sân bay quốc tế Long Thành", "C. Sân bay Phú Quốc", "D. Sân bay Cam Ranh"],
                    ans: 1,
                    explain: "Tuyệt vời! Sân bay quốc tế Long Thành là động lực giúp Đồng Nai vươn tầm cực tăng trưởng!"
                },
                {
                    q: "Dòng sông lớn nào gắn liền với lịch sử, văn hóa và đời sống của người dân tỉnh Đồng Nai?",
                    options: ["A. Sông Hồng", "B. Sông Hương", "C. Sông Đồng Nai", "D. Sông Hàn"],
                    ans: 2,
                    explain: "Đúng rồi! Sông Đồng Nai hiền hòa bồi đắp phù sa và nguồn nước cho toàn vùng."
                },
                {
                    q: "Làng nghề truyền thống nào ở Biên Hòa - Đồng Nai nổi tiếng khắp trong và ngoài nước?",
                    options: ["A. Nghề làm gốm Biên Hòa", "B. Nghề làm nón bài thơ", "C. Nghề dệt thổ cẩm Tây Bắc", "D. Nghề làm đàn bầu"],
                    ans: 0,
                    explain: "Chính xác! Gốm Biên Hòa nổi tiếng với dòng men xanh đồng trổ bông độc đáo."
                },
                {
                    q: "Hồ thủy điện lớn nào tại Đồng Nai cung cấp điện năng và nước sinh hoạt cho cả miền Nam?",
                    options: ["A. Hồ Hòa Bình", "B. Hồ Trị An", "C. Hồ Ba Bể", "D. Hồ Xuân Hương"],
                    ans: 1,
                    explain: "Xuất sắc! Thủy điện Trị An là công trình năng lượng lịch sử trên sông Đồng Nai."
                }
            ]
        },

        // 5: Trung tâm AI Tương lai
        {
            id: 5,
            name: "Trung tâm AI Tương lai",
            badge_name: "Huy hiệu AI 2065",
            desc: "Khám phá trí tuệ nhân tạo, robot thông minh và công nghệ số kiến tạo tương lai năm 2065!",
            missions: [
                "Chinh phục 5 câu hỏi Công nghệ AI",
                "Trả lời đúng ít nhất 4 câu",
                "Thời gian: 3 phút"
            ],
            reward_stars: 20,
            reward_xp: 30,
            completed: false,
            best_score: 0,
            treasure_title: "Trí tuệ Nhân tạo vì Con người",
            treasure_fact: "Tại Trung tâm AI Tương lai 2065, AI là người bạn đồng hành giúp học sinh học tập thông minh, hỗ trợ bác sĩ chữa bệnh và dự báo thời tiết chính xác!",
            questions: [
                {
                    q: "Chữ viết tắt 'AI' trong công nghệ thông tin có nghĩa là gì?",
                    options: ["A. Trí tuệ nhân tạo (Artificial Intelligence)", "B. Trò chơi điện tử", "C. Máy tính bỏ túi", "D. Mạng dây cáp đồng"],
                    ans: 0,
                    explain: "Chính xác! AI là viết tắt của Artificial Intelligence (Trí tuệ nhân tạo)."
                },
                {
                    q: "Khi sử dụng Trợ lý AI trong học tập, cách làm nào sau đây là THÔNG MINH nhất?",
                    options: ["A. Nhờ AI giải thích bài khó để hiểu sâu kiến thức", "B. Chép nguyên văn mà không suy nghĩ", "C. Không bao giờ tự làm bài", "D. Dùng AI để gian lận khi thi"],
                    ans: 0,
                    explain: "Tuyệt vời! AI là người bạn đồng hành giúp ta hiểu bài và tư duy tốt hơn."
                },
                {
                    q: "Để giữ an toàn thông tin cá nhân trên mạng Internet, em KHÔNG nên làm điều gì?",
                    options: ["A. Đặt mật khẩu mạnh", "B. Chia sẻ mật khẩu và thông tin cá nhân cho người lạ", "C. Hỏi ý kiến cha mẹ, thầy cô", "D. Sử dụng phần mềm an toàn"],
                    ans: 1,
                    explain: "Đúng rồi! Tuyệt đối không chia sẻ mật khẩu cho người lạ trên mạng."
                },
                {
                    q: "Trong Thành phố Tri thức 2065, cảm biến IoT và AI giúp hệ thống đèn giao thông hoạt động như thế nào?",
                    options: ["A. Tự động điều chỉnh nhịp đèn thông minh để chống ùn tắc", "B. Tắt hết đèn cả ngày", "C. Chỉ bật đèn đỏ mãi mãi", "D. Nhấp nháy ngẫu nhiên"],
                    ans: 0,
                    explain: "Chính xác! Giao thông thông minh dùng AI để phân luồng xe êm thuận, an toàn."
                },
                {
                    q: "Yếu tố quan trọng nhất để làm chủ công nghệ trong tương lai năm 2065 là gì?",
                    options: ["A. Không ngừng học tập, sáng tạo và rèn luyện đạo đức tốt", "B. Chỉ chơi game suốt ngày", "C. Ngừng đọc sách", "D. Phụ thuộc hoàn toàn vào máy móc"],
                    ans: 0,
                    explain: "Xuất sắc! Tri thức, sự sáng tạo và nhân cách chính là chìa khóa của tương lai!"
                }
            ]
        }
    ];
}

/// @function point_in_box(px, py, x1, y1, x2, y2)
function point_in_box(px, py, x1, y1, x2, y2) {
    return (px >= x1 && px <= x2 && py >= y1 && py <= y2);
}

/// @function draw_text_outlined(xx, yy, str, text_col, outline_col)
function draw_text_outlined(xx, yy, str, text_col, outline_col) {
    var old_col = draw_get_color();
    var old_alpha = draw_get_alpha();

    // Bóng đổ mềm phía dưới
    draw_set_color(c_black);
    draw_set_alpha(old_alpha * 0.65);
    draw_text(xx + 2, yy + 3, str);

    // Viền chữ 8 hướng sắc nét
    draw_set_color(outline_col);
    draw_set_alpha(old_alpha);
    draw_text(xx - 2, yy, str);
    draw_text(xx + 2, yy, str);
    draw_text(xx, yy - 2, str);
    draw_text(xx, yy + 2, str);
    draw_text(xx - 1, yy - 1, str);
    draw_text(xx + 1, yy - 1, str);
    draw_text(xx - 1, yy + 1, str);
    draw_text(xx + 1, yy + 1, str);

    // Chữ chính
    draw_set_color(text_col);
    draw_text(xx, yy, str);

    draw_set_color(old_col);
    draw_set_alpha(old_alpha);
}

/// @function draw_text_ext_outlined(xx, yy, str, sep, w, text_col, outline_col)
function draw_text_ext_outlined(xx, yy, str, sep, w, text_col, outline_col) {
    var old_col = draw_get_color();
    var old_alpha = draw_get_alpha();

    draw_set_color(c_black);
    draw_set_alpha(old_alpha * 0.6);
    draw_text_ext(xx + 2, yy + 2, str, sep, w);

    draw_set_color(outline_col);
    draw_set_alpha(old_alpha);
    draw_text_ext(xx - 1, yy, str, sep, w);
    draw_text_ext(xx + 1, yy, str, sep, w);
    draw_text_ext(xx, yy - 1, str, sep, w);
    draw_text_ext(xx, yy + 1, str, sep, w);

    draw_set_color(text_col);
    draw_text_ext(xx, yy, str, sep, w);

    draw_set_color(old_col);
    draw_set_alpha(old_alpha);
}

/// @function draw_hover_effect(x1, y1, x2, y2, rad, col)
function draw_hover_effect(x1, y1, x2, y2, rad, col) {
    var old_col = draw_get_color();
    var old_alpha = draw_get_alpha();
    var pulse = 0.22 + 0.10 * sin(current_time * 0.008);

    draw_set_color(col);
    draw_set_alpha(pulse);
    draw_roundrect_ext(x1, y1, x2, y2, rad, rad, false);

    draw_set_alpha(0.85);
    draw_roundrect_ext(x1, y1, x2, y2, rad, rad, true);
    draw_roundrect_ext(x1 + 1, y1 + 1, x2 - 1, y2 - 1, rad, rad, true);

    draw_set_color(old_col);
    draw_set_alpha(old_alpha);
}

/// @function draw_pill_button(x1, y1, x2, y2, label, bg_col, border_col, is_hover)
function draw_pill_button(x1, y1, x2, y2, label, bg_col, border_col, is_hover) {
    var old_col = draw_get_color();
    var old_alpha = draw_get_alpha();
    var h = y2 - y1;

    draw_set_color(c_black);
    draw_set_alpha(0.45);
    draw_roundrect_ext(x1 + 2, y1 + 4, x2 + 2, y2 + 4, h, h, false);

    draw_set_color(is_hover ? merge_color(bg_col, c_white, 0.22) : bg_col);
    draw_set_alpha(0.92);
    draw_roundrect_ext(x1, y1, x2, y2, h, h, false);

    draw_set_color(is_hover ? make_color_rgb(255, 240, 120) : border_col);
    draw_set_alpha(1.0);
    draw_roundrect_ext(x1, y1, x2, y2, h, h, true);
    draw_roundrect_ext(x1 + 1, y1 + 1, x2 - 1, y2 - 1, h, h, true);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_outlined((x1 + x2) * 0.5, (y1 + y2) * 0.5, label, c_white, make_color_rgb(10, 35, 80));

    draw_set_color(old_col);
    draw_set_alpha(old_alpha);
}

/// @function scr_add_rewards(stars_amount, xp_amount)
function scr_add_rewards(stars_amount, xp_amount) {
    global.player_stars += stars_amount;
    global.player_xp += xp_amount;
    while (global.player_xp >= global.player_xp_max) {
        global.player_xp -= global.player_xp_max;
        global.player_level += 1;
        global.player_xp_max = 100 + (global.player_level - 1) * 50;
    }
}

/// @function scr_step_mission_popup()
function scr_step_mission_popup() {
    if (!global.show_mission_popup) return false;

    var mx = mouse_x;
    var my = mouse_y;

    if (keyboard_check_pressed(vk_escape)) {
        global.show_mission_popup = false;
        return true;
    }

    if (mouse_check_button_pressed(mb_left)) {
        // Nút X đóng popup (1188, 92)
        if (point_distance(mx, my, 1188, 92) <= 48) {
            global.show_mission_popup = false;
            return true;
        }
        // Nút chuyển thành phố trước / sau trên góc phải tiêu đề
        if (point_in_box(mx, my, 1055, 162, 1105, 208)) {
            global.selected_city = (global.selected_city + 5) mod 6;
            return true;
        }
        if (point_in_box(mx, my, 1112, 162, 1162, 208)) {
            global.selected_city = (global.selected_city + 1) mod 6;
            return true;
        }
        // Nút cam "Bắt đầu" [776..1174, 552..646]
        if (point_in_box(mx, my, 776, 552, 1174, 646)) {
            global.show_mission_popup = false;
            room_goto(rm_quiz);
            return true;
        }
    }
    return true;
}

/// @function scr_draw_mission_popup()
function scr_draw_mission_popup() {
    if (!global.show_mission_popup) return;

    var mx = mouse_x;
    var my = mouse_y;
    var city = global.cities[global.selected_city];

    // Làm tối nền phía sau
    draw_set_color(c_black);
    draw_set_alpha(0.65);
    draw_rectangle(0, 0, 1280, 720, false);
    draw_set_alpha(1.0);
    draw_set_color(c_white);

    // Vẽ khung Popup gốc đã làm sạch chữ (Screen 4)
    draw_sprite(spr_bg_popup, 0, 0, 0);

    // Vẽ ảnh thu nhỏ của Thành phố đang chọn vào khung trái (98, 164)
    draw_sprite(spr_city_thumb, global.selected_city, 98, 164);

    // Viền sáng quanh ảnh thành phố
    draw_set_color(make_color_rgb(110, 220, 255));
    draw_roundrect_ext(98, 164, 98 + 396, 164 + 234, 24, 24, true);

    // Tiêu đề chính trên băng rôn vàng: "Nhiệm vụ hôm nay"
    draw_set_font(fnt_Title);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_outlined(644, 85, "Nhiệm vụ hôm nay", make_color_rgb(255, 252, 215), make_color_rgb(130, 55, 10));

    // Tiêu đề "Phần thưởng" bên trái
    draw_set_font(fnt_Heading);
    draw_text_outlined(303, 444, "Phần thưởng", make_color_rgb(255, 245, 190), make_color_rgb(15, 45, 95));

    // Số lượng phần thưởng dưới 3 ô bên trái
    draw_set_font(fnt_Main);
    draw_text_outlined(162, 578, "+" + string(city.reward_stars), make_color_rgb(255, 240, 120), make_color_rgb(20, 45, 90));
    draw_text_outlined(297, 578, "+" + string(city.reward_xp), make_color_rgb(140, 245, 255), make_color_rgb(20, 45, 90));

    draw_set_font(fnt_Small);
    draw_text_outlined(433, 572, "Huy hiệu", c_white, make_color_rgb(20, 45, 90));
    draw_text_outlined(433, 592, "Tri thức", make_color_rgb(255, 230, 110), make_color_rgb(20, 45, 90));

    // Tên Thành phố bên phải
    draw_set_font(fnt_Title);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    draw_text_outlined(540, 185, city.name, make_color_rgb(255, 235, 115), make_color_rgb(15, 45, 95));

    // Nút nhỏ < > đổi nhanh giữa 6 thành phố ngay trong Popup
    draw_set_font(fnt_Main);
    draw_pill_button(1055, 162, 1105, 208, "<", make_color_rgb(25, 95, 185), make_color_rgb(120, 220, 255), point_in_box(mx, my, 1055, 162, 1105, 208));
    draw_pill_button(1112, 162, 1162, 208, ">", make_color_rgb(25, 95, 185), make_color_rgb(120, 220, 255), point_in_box(mx, my, 1112, 162, 1162, 208));

    // Mô tả nhiệm vụ
    draw_set_font(fnt_Main);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_text_ext_outlined(540, 236, city.desc, 30, 610, c_white, make_color_rgb(15, 40, 85));

    // Tiêu đề "Nhiệm vụ cụ thể:"
    draw_set_font(fnt_Heading);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_outlined(713, 382, "Nhiệm vụ cụ thể:", make_color_rgb(255, 248, 210), make_color_rgb(15, 50, 105));

    // 3 dòng nhiệm vụ cụ thể bên cạnh 3 ngôi sao vàng
    draw_set_font(fnt_Main);
    draw_set_halign(fa_left);
    draw_set_valign(fa_middle);
    for (var i = 0; i < 3; i++) {
        var by = 434 + i * 40;
        draw_text_outlined(602, by, city.missions[i], c_white, make_color_rgb(12, 38, 82));
    }

    // Trạng thái đã hoàn thành (nếu có)
    if (city.completed) {
        draw_set_font(fnt_Small);
        draw_set_halign(fa_left);
        draw_text_outlined(540, 565, "Đã hoàn thành! Điểm cao nhất: " + string(city.best_score) + "/5", make_color_rgb(120, 255, 150), make_color_rgb(10, 45, 25));
    }

    // Nút cam "Bắt đầu" [776..1174, 552..646]
    if (point_in_box(mx, my, 776, 552, 1174, 646)) {
        draw_hover_effect(776, 552, 1174, 646, 44, make_color_rgb(255, 230, 100));
    }
    draw_set_font(fnt_Title);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text_outlined(976, 598, "Bắt đầu", c_white, make_color_rgb(140, 50, 5));

    // Hiệu ứng hover nút đóng X
    if (point_distance(mx, my, 1188, 92) <= 48) {
        draw_hover_effect(1144, 48, 1232, 136, 44, make_color_rgb(255, 120, 120));
    }
}

/// @function scr_step_secondary_modal()
function scr_step_secondary_modal() {
    if (global.active_modal == "") return false;

    var mx = mouse_x;
    var my = mouse_y;

    if (keyboard_check_pressed(vk_escape)) {
        global.active_modal = "";
        return true;
    }

    if (mouse_check_button_pressed(mb_left)) {
        // Nút đóng góc trên phải (1060, 110) hoặc nút Đóng dưới đáy (530..750, 585..638)
        if (point_in_box(mx, my, 1030, 82, 1105, 145) || point_in_box(mx, my, 530, 585, 750, 638)) {
            global.active_modal = "";
            return true;
        }

        if (global.active_modal == "gift") {
            if (!global.daily_gift_claimed && point_in_box(mx, my, 460, 440, 820, 515)) {
                global.daily_gift_claimed = true;
                scr_add_rewards(50, 30);
                return true;
            }
        } else if (global.active_modal == "ai_helper") {
            if (point_in_box(mx, my, 460, 485, 820, 545)) {
                global.ai_tip_index = (global.ai_tip_index + 1) mod array_length(global.ai_tips);
                return true;
            }
        } else if (global.active_modal == "treasure") {
            if (point_in_box(mx, my, 240, 495, 420, 548)) {
                global.treasure_page = (global.treasure_page + 5) mod 6;
                return true;
            }
            if (point_in_box(mx, my, 860, 495, 1040, 548)) {
                global.treasure_page = (global.treasure_page + 1) mod 6;
                return true;
            }
        } else if (global.active_modal == "settings") {
            if (point_in_box(mx, my, 450, 260, 830, 320)) {
                global.sound_enabled = !global.sound_enabled;
                return true;
            }
            if (point_in_box(mx, my, 450, 345, 830, 405)) {
                global.music_enabled = !global.music_enabled;
                return true;
            }
            if (point_in_box(mx, my, 450, 430, 830, 490)) {
                window_set_fullscreen(!window_get_fullscreen());
                return true;
            }
        }
    }
    return true;
}

/// @function scr_draw_secondary_modal()
function scr_draw_secondary_modal() {
    if (global.active_modal == "") return;

    var mx = mouse_x;
    var my = mouse_y;

    // Lớp phủ mờ
    draw_set_color(c_black);
    draw_set_alpha(0.72);
    draw_rectangle(0, 0, 1280, 720, false);

    // Khung bảng kính tương lai [160..1120, 70..655]
    draw_set_color(make_color_rgb(14, 42, 98));
    draw_set_alpha(0.95);
    draw_roundrect_ext(160, 70, 1120, 655, 36, 36, false);

    draw_set_color(make_color_rgb(90, 215, 255));
    draw_set_alpha(1.0);
    draw_roundrect_ext(160, 70, 1120, 655, 36, 36, true);
    draw_roundrect_ext(163, 73, 1117, 652, 34, 34, true);

    // Thanh tiêu đề trên cùng
    draw_set_color(make_color_rgb(28, 92, 195));
    draw_roundrect_ext(180, 82, 1100, 148, 26, 26, false);

    // Nút X góc phải
    draw_pill_button(1035, 88, 1095, 142, "X", make_color_rgb(215, 50, 65), make_color_rgb(255, 170, 170), point_in_box(mx, my, 1035, 88, 1095, 142));

    draw_set_font(fnt_Title);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    if (global.active_modal == "achievements") {
        draw_text_outlined(640, 115, "BẢNG THÀNH TÍCH & HUY HIỆU", make_color_rgb(255, 240, 130), make_color_rgb(10, 35, 80));

        var completed_cnt = 0;
        for (var i = 0; i < 6; i++) {
            if (global.cities[i].completed) completed_cnt++;
        }
        draw_set_font(fnt_Main);
        draw_text_outlined(640, 175, "Cấp độ: Lv." + string(global.player_level) + "   |   Tổng Sao: " + string(global.player_stars) + "   |   Thành phố hoàn thành: " + string(completed_cnt) + "/6", make_color_rgb(160, 240, 255), make_color_rgb(10, 30, 70));

        for (var i = 0; i < 6; i++) {
            var col = i mod 2;
            var row = i div 2;
            var bx1 = 200 + col * 450;
            var by1 = 210 + row * 115;
            var bx2 = bx1 + 430;
            var by2 = by1 + 100;
            var cdata = global.cities[i];

            draw_set_color(cdata.completed ? make_color_rgb(22, 105, 85) : make_color_rgb(22, 58, 125));
            draw_roundrect_ext(bx1, by1, bx2, by2, 20, 20, false);
            draw_set_color(cdata.completed ? make_color_rgb(110, 255, 160) : make_color_rgb(80, 165, 235));
            draw_roundrect_ext(bx1, by1, bx2, by2, 20, 20, true);

            draw_set_halign(fa_left);
            draw_set_font(fnt_Main);
            draw_text_outlined(bx1 + 20, by1 + 32, cdata.badge_name, make_color_rgb(255, 235, 120), make_color_rgb(10, 30, 70));
            draw_set_font(fnt_Body);
            var status_txt = cdata.completed ? ("Đã mở khóa! Điểm cao nhất: " + string(cdata.best_score) + "/5") : ("Chưa mở khóa - Hãy vượt qua " + cdata.name);
            draw_text_outlined(bx1 + 20, by1 + 68, status_txt, c_white, make_color_rgb(10, 30, 70));
        }
    } else if (global.active_modal == "treasure") {
        draw_text_outlined(640, 115, "KHO BÁU TRI THỨC 2065", make_color_rgb(255, 240, 130), make_color_rgb(10, 35, 80));
        var tc = global.cities[global.treasure_page];

        // Ảnh minh họa thành phố
        draw_sprite(spr_city_thumb, global.treasure_page, 210, 195);
        draw_set_color(make_color_rgb(120, 230, 255));
        draw_roundrect_ext(210, 195, 210 + 396, 195 + 234, 20, 20, true);

        draw_set_halign(fa_left);
        draw_set_font(fnt_Heading);
        draw_text_outlined(635, 215, tc.treasure_title, make_color_rgb(255, 230, 110), make_color_rgb(10, 35, 80));

        draw_set_font(fnt_Main);
        draw_set_valign(fa_top);
        draw_text_ext_outlined(635, 255, tc.treasure_fact, 32, 440, c_white, make_color_rgb(10, 35, 80));

        draw_set_valign(fa_middle);
        draw_set_font(fnt_Main);
        draw_pill_button(240, 495, 420, 548, "< Thẻ trước", make_color_rgb(30, 95, 190), make_color_rgb(120, 220, 255), point_in_box(mx, my, 240, 495, 420, 548));
        draw_set_halign(fa_center);
        draw_text_outlined(640, 520, "Thẻ tri thức " + string(global.treasure_page + 1) + " / 6", make_color_rgb(180, 240, 255), make_color_rgb(10, 35, 80));
        draw_pill_button(860, 495, 1040, 548, "Thẻ tiếp >", make_color_rgb(30, 95, 190), make_color_rgb(120, 220, 255), point_in_box(mx, my, 860, 495, 1040, 548));
    } else if (global.active_modal == "ai_helper") {
        draw_text_outlined(640, 115, "TRỢ LÝ ROBOT AI TƯƠNG LAI", make_color_rgb(255, 240, 130), make_color_rgb(10, 35, 80));

        draw_set_font(fnt_Heading);
        draw_text_outlined(640, 200, "Xin chào " + global.player_name + "! Mình là Robot AI 2065.", make_color_rgb(140, 245, 255), make_color_rgb(10, 35, 80));

        draw_set_color(make_color_rgb(20, 68, 145));
        draw_roundrect_ext(230, 245, 1050, 450, 28, 28, false);
        draw_set_color(make_color_rgb(110, 225, 255));
        draw_roundrect_ext(230, 245, 1050, 450, 28, 28, true);

        draw_set_font(fnt_Heading);
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_text_ext_outlined(640, 345, global.ai_tips[global.ai_tip_index], 36, 760, c_white, make_color_rgb(10, 35, 80));

        draw_set_font(fnt_Main);
        draw_pill_button(460, 485, 820, 545, "Xem gợi ý tiếp theo >>", make_color_rgb(235, 135, 25), make_color_rgb(255, 235, 130), point_in_box(mx, my, 460, 485, 820, 545));
    } else if (global.active_modal == "gift") {
        draw_text_outlined(640, 115, "QUÀ TẶNG KHÁM PHÁ MỖI NGÀY", make_color_rgb(255, 240, 130), make_color_rgb(10, 35, 80));
        draw_set_font(fnt_Heading);
        draw_text_outlined(640, 230, "Phần thưởng dành cho Nhà Khám Phá Chăm Chỉ:", c_white, make_color_rgb(10, 35, 80));
        draw_set_font(fnt_Title);
        draw_text_outlined(640, 320, "+50 Ngôi sao Tri thức   &   +30 XP", make_color_rgb(255, 235, 100), make_color_rgb(120, 50, 10));

        draw_set_font(fnt_Heading);
        if (!global.daily_gift_claimed) {
            draw_pill_button(460, 440, 820, 515, "NHẬN QUÀ NGAY!", make_color_rgb(240, 130, 20), make_color_rgb(255, 240, 130), point_in_box(mx, my, 460, 440, 820, 515));
        } else {
            draw_text_outlined(640, 475, "Bạn đã nhận quà hôm nay rồi! Hãy tiếp tục khám phá 6 thành phố nhé!", make_color_rgb(130, 255, 160), make_color_rgb(10, 45, 25));
        }
    } else if (global.active_modal == "leaderboard") {
        draw_text_outlined(640, 115, "BẢNG XẾP HẠNG NHÀ KHÁM PHÁ", make_color_rgb(255, 240, 130), make_color_rgb(10, 35, 80));
        var leaders = [
            { name: "1. Lan Anh - Chuyên gia AI", stars: 260, lv: 4 },
            { name: "2. Hoàng Nam - Kiện tướng Toán", stars: 210, lv: 3 },
            { name: "3. " + global.player_name + " (Bạn)", stars: global.player_stars, lv: global.player_level },
            { name: "4. Bảo Ngọc - Đại sứ Xanh", stars: 110, lv: 1 },
            { name: "5. Quốc Khánh - Nhà Sử học trẻ", stars: 95, lv: 1 }
        ];
        draw_set_font(fnt_Main);
        for (var i = 0; i < 5; i++) {
            var ly = 195 + i * 72;
            var is_me = (i == 2);
            draw_set_color(is_me ? make_color_rgb(35, 115, 195) : make_color_rgb(20, 58, 125));
            draw_roundrect_ext(240, ly, 1040, ly + 58, 18, 18, false);
            draw_set_color(is_me ? make_color_rgb(255, 235, 110) : make_color_rgb(80, 170, 240));
            draw_roundrect_ext(240, ly, 1040, ly + 58, 18, 18, true);

            draw_set_halign(fa_left);
            draw_text_outlined(270, ly + 29, leaders[i].name, is_me ? make_color_rgb(255, 245, 130) : c_white, make_color_rgb(10, 30, 70));
            draw_set_halign(fa_right);
            draw_text_outlined(1010, ly + 29, "Lv." + string(leaders[i].lv) + "  |  " + string(leaders[i].stars) + " Sao", make_color_rgb(255, 230, 100), make_color_rgb(10, 30, 70));
        }
    } else if (global.active_modal == "help") {
        draw_text_outlined(640, 115, "HƯỚNG DẪN CHƠI GAME", make_color_rgb(255, 240, 130), make_color_rgb(10, 35, 80));
        draw_set_font(fnt_Main);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
        var help_str = "1. Tại Sảnh nhân vật (Hub): Xem cấp độ, kinh nghiệm (XP), số Sao, mở Kho báu Tri thức hoặc trò chuyện cùng Trợ lý AI.\n\n" +
                       "2. Tại Bản đồ Thành phố: Nhấn vào bất kỳ đảo nào trong 6 Thành phố (Toán học, Ngôn ngữ, Khoa học, Thành phố Xanh, Lịch sử - Văn hóa, Trung tâm AI) để mở bảng Nhiệm vụ hôm nay.\n\n" +
                       "3. Tại Màn chơi Trắc nghiệm: Đọc kỹ câu hỏi và chọn 1 trong 4 đáp án A, B, C, D trước khi đồng hồ đếm ngược về 00:00. Trả lời đúng từ 4/5 câu để nhận trọn bộ Sao, XP và Huy hiệu Tri thức!";
        draw_text_ext_outlined(230, 195, help_str, 34, 820, c_white, make_color_rgb(10, 30, 70));
    } else if (global.active_modal == "settings") {
        draw_text_outlined(640, 115, "CÀI ĐẶT HỆ THỐNG", make_color_rgb(255, 240, 130), make_color_rgb(10, 35, 80));
        draw_set_font(fnt_Heading);
        draw_pill_button(450, 260, 830, 320, "Âm thanh hiệu ứng: " + (global.sound_enabled ? "BẬT" : "TẮT"), make_color_rgb(28, 95, 185), make_color_rgb(120, 220, 255), point_in_box(mx, my, 450, 260, 830, 320));
        draw_pill_button(450, 345, 830, 405, "Nhạc nền: " + (global.music_enabled ? "BẬT" : "TẮT"), make_color_rgb(28, 95, 185), make_color_rgb(120, 220, 255), point_in_box(mx, my, 450, 345, 830, 405));
        draw_pill_button(450, 430, 830, 490, "Chế độ Toàn màn hình (Fullscreen)", make_color_rgb(28, 95, 185), make_color_rgb(120, 220, 255), point_in_box(mx, my, 450, 430, 830, 490));
    }

    // Nút Đóng chung dưới đáy
    draw_set_font(fnt_Heading);
    draw_pill_button(530, 585, 750, 638, "Đóng", make_color_rgb(220, 75, 40), make_color_rgb(255, 220, 150), point_in_box(mx, my, 530, 585, 750, 638));

    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
