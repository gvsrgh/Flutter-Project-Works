# Tic Tac Toe Game 🎮

This Flutter project is a classic **Tic Tac Toe** game with a **loading screen** that welcomes users before they start playing. The project was developed as part of the **Flutter Workshop** at our college (25|09|2024 - 29|09|2024) with the help of prompt engineering through ChatGPT.

## Features 📋

- **Loading Screen**: Displays a welcome message with a fade-in effect before transitioning to the game screen.
- **Classic Tic Tac Toe**: Play against a friend with alternating "X" and "O" turns.
- **Winning Logic**: Determines and displays the winner based on classic Tic Tac Toe rules.
- **Draw Detection**: If no one wins and the grid is full, it declares a draw.
- **Reset Button**: Allows users to reset the game and play again.

## Screenshots

![Loading Screen](https://github.com/gvsrgh/Flutter-Project-Works/blob/main/C02%20Tic%20Tac%20Toe%20Game/Output1.png)  
*Loading screen welcoming the user.*

![Game Screen](https://github.com/gvsrgh/Flutter-Project-Works/blob/main/C02%20Tic%20Tac%20Toe%20Game/OutputD.png)  
*Main Tic Tac Toe game screen.*

---

## How to Run the Project 💻

### 1. Create a Default Flutter Project

1. Open the folder where you want to create the project.
2. Copy the path of the folder.
3. Open Command Prompt (or Terminal) and change to the directory using the `cd` command:
   ```sh
   cd path/to/your/folder
   ```
4. Type the following command to create a new Flutter project:
   ```sh
   flutter create projectname
   ```
5. You have successfully created a default Flutter project folder.

### 2. Copy-Paste My Files

1. Copy the modified files I've shared (loading screen, calculator screen, and main code).
2. Paste them into the project folder you just created.
3. Replace the existing files if prompted.

### 3. Run the Project

1. Open the project in VS Code or Android Studio.
2. Ensure you have a device connected or an emulator running.
3. Start debugging to view the project or run the project using the following command in the terminal:
   ```sh
   flutter run
   ```

## Folder Structure 📁

```bash
.
├── lib
│   ├── main.dart            # Entry point of the app
│   ├── tic_tac_toe.dart     # Main Tic Tac Toe game logic
│   └── loading_screen.dart  # Loading screen logic with fade animation
├── pubspec.yaml             # Dependencies and assets
└── README.md                # This file
```

---

## Dependencies 🛠️

Make sure to add the following dependencies in your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
```

## Contribution 🤝

Contributions are welcome! If you find any issues or want to improve the project, feel free to create a pull request or submit an issue.

---

Enjoy playing **GVSR's Tic Tac Toe**! ✨

---

Let me know if you'd like to modify or add any additional sections!
