# Knowledge City 2065 – Smart Learning – Future Exploration
*(Dong Nai Rising as a Growth Pole)*

An interactive educational trivia and adventure game built for **GameMaker Studio 2 / GameMaker LTS 2026**, featuring a complete `.yyp` source project, an importable `.yyz` project archive, a standalone pre-compiled **Windows Executable (`.exe`)**, and an interactive **HTML5 Web Playable Build**.

---

## 1. Quick Start & Deliverables

### Option A: Import the `.yyz` Archive into GameMaker Studio
1. Launch **GameMaker Studio 2 / GameMaker LTS 2026**.
2. On the Start Page (or via **File -> Import Project...**), select:
   - `c:\Users\ADMIN\Desktop\Downloads\ThanhPhoTriThuc2065\ThanhPhoTriThuc2065.yyz`
3. Choose a destination folder and press **F5** (Run) to compile and launch the game.

### Option B: Open the `.yyp` Project Directly in GameMaker Studio
1. Launch **GameMaker Studio 2 / GameMaker LTS 2026**.
2. Click **Open** and select:
   - `c:\Users\ADMIN\Desktop\Downloads\ThanhPhoTriThuc2065\ThanhPhoTriThuc2065.yyp`
3. Press **F5** (Run) to start the game.

### Option C: Run the Standalone Windows Executable (`.exe`)
- Navigate to `windows_build/` and double-click:
  - `c:\Users\ADMIN\Desktop\Downloads\ThanhPhoTriThuc2065\windows_build\ThanhPhoTriThuc2065.exe`
- No IDE installation is required to run this pre-compiled Windows build.

### Option D: Run the Standalone HTML5 Web Build (with Web Audio & AI Voiceover)
- Open the following file in any modern web browser (Chrome, Edge, Firefox, Safari):
  - `c:\Users\ADMIN\Desktop\Downloads\ThanhPhoTriThuc2065\web_demo\index.html`
- Includes a quick-navigation top bar to switch across all 5 screens instantly, synthesized Web Audio sound effects, and Web Speech API voiceover.

---

## 2. Controls & Keyboard Shortcuts

- **Mouse Left-Click**: Interact with buttons, floating city islands, mission popups, answer choices (`A`, `B`, `C`, `D`), and modal windows.
- **Presentation & Debug Hotkeys (GameMaker & Windows Build)**:
  - `F1`: Jump directly to **Screen 1 – Main Menu** (`rm_menu`)
  - `F2`: Jump directly to **Screen 2 – Player Character Hub** (`rm_hub`)
  - `F3`: Jump directly to **Screen 3 – 6-City World Map** (`rm_map`)
  - `F4`: Jump directly to **Screen 5 – Quiz Gameplay Screen** (`rm_quiz`)
  - `ESC`: Close any active popup/modal or return to the previous screen.

---

## 3. Gameplay Flow & 5 Core Screens

1. **Screen 1 – Main Menu (`rm_menu`)**:
   - Features the 3D characters, futuristic Dong Nai 2065 skyline, and 4 main action capsules: **Start Game**, **Achievements**, **Settings**, and **Exit Game**, plus a quick-jump button to the World Map.
2. **Screen 2 – Player Character Hub (`rm_hub`)**:
   - Displays the player profile (**Explorer Minh**), current level (`Lv.1`), experience bar (`20 / 100 XP`), star balance (`120 Stars`), interactive character dialogue bar, and 4 feature buttons:
     - **Today's Mission**: Opens the Mission Briefing Popup.
     - **Knowledge Treasure**: Opens a 6-page illustrated encyclopedia covering mathematics, language, clean energy, ecology, Dong Nai history & culture, and AI technology.
     - **Achievements**: Displays unlocked city badges, best scores, and overall completion stats.
     - **AI Assistant**: Interactive AI Robot companion sharing study tips and smart learning advice.
3. **Screen 3 – 6-City World Map (`rm_map`)**:
   - Interactive aerial map featuring 6 floating futuristic islands:
     1. **Mathematics City**
     2. **Language Kingdom**
     3. **Science City**
     4. **Green City**
     5. **History & Culture City**
     6. **Future AI Center**
   - Top-right HUD provides access to **Daily Gift** (`+50 Stars & +30 XP`), **Leaderboard**, and **Help Guide**.
4. **Screen 4 – Mission Briefing Popup (`spr_bg_popup` overlay)**:
   - Triggered when clicking any of the 6 city islands on the World Map or clicking **Today's Mission** in the Player Hub.
   - Displays the selected city's thumbnail preview, mission description, 3 specific objectives, reward preview (`+20 Stars`, `+30 XP`, and `Knowledge Badge`), city cycling arrows (`<` / `>`), and the **Start** button.
5. **Screen 5 – Quiz Gameplay Screen (`rm_quiz`)**:
   - Features a live `00:45` countdown timer per question, question progress counter (`1 / 5` to `5 / 5`), holographic question board, 4 multiple-choice answer capsules (`A`, `B`, `C`, `D`), and real-time feedback from the AI Robot companion.
   - Answering at least `4 / 5` questions correctly unlocks the city's **Knowledge Badge** and awards the full Star and XP bonus.

---

## 4. GameMaker Project Architecture

```text
ThanhPhoTriThuc2065/
├── ThanhPhoTriThuc2065.yyp          # Main GameMaker Studio project file
├── ThanhPhoTriThuc2065.yyz          # Importable GameMaker project archive
├── options/
│   └── main/options_main.yy         # Global project configuration (60 FPS, 1280x720)
├── sprites/
│   ├── spr_bg_menu/                 # Cleaned 1280x720 Main Menu background
│   ├── spr_bg_hub/                  # Cleaned 1280x720 Player Hub background
│   ├── spr_bg_map/                  # Cleaned 1280x720 6-Island World Map background
│   ├── spr_bg_popup/                # Cleaned 1280x720 Mission Briefing Popup frame
│   ├── spr_bg_quiz/                 # Cleaned 1280x720 Quiz Gameplay background
│   └── spr_city_thumb/              # 6-frame (396x234) rounded city island thumbnails
├── fonts/
│   ├── fnt_Title/                   # Pre-baked Segoe UI Bold (24pt) with full Unicode glyphs
│   ├── fnt_Heading/                 # Pre-baked Segoe UI Bold (18pt) with full Unicode glyphs
│   ├── fnt_Main/                    # Pre-baked Segoe UI Bold (15pt) with full Unicode glyphs
│   ├── fnt_Body/                    # Pre-baked Segoe UI Bold (13pt) with full Unicode glyphs
│   └── fnt_Small/                   # Pre-baked Segoe UI Bold (11pt) with full Unicode glyphs
├── scripts/
│   └── scr_game_data/               # Global state, 30-question database, UI & modal renderers
├── objects/
│   ├── obj_GameManager/             # Persistent state manager & F1-F4 navigation hotkeys
│   ├── obj_MenuController/          # Screen 1 (Main Menu) logic & UI rendering
│   ├── obj_HubController/           # Screen 2 (Player Hub) logic & UI rendering
│   ├── obj_MapController/           # Screen 3 (World Map) & Screen 4 (Popup) controller
│   └── obj_QuizController/          # Screen 5 (Quiz Gameplay) timer, scoring & rewards
├── rooms/
│   ├── rm_menu/                     # Main Menu room (1280x720)
│   ├── rm_hub/                      # Player Hub room (1280x720)
│   ├── rm_map/                      # World Map room (1280x720)
│   └── rm_quiz/                     # Quiz Gameplay room (1280x720)
├── windows_build/
│   ├── ThanhPhoTriThuc2065.exe      # Pre-compiled standalone Windows executable
│   ├── data.win                     # Compiled GameMaker asset & bytecode bundle
│   └── options.ini                  # Windows runtime display settings
└── web_demo/
    ├── index.html                   # Standalone HTML5 Canvas playable build
    └── assets/                      # Cleaned PNG artwork assets for the Web build
```
