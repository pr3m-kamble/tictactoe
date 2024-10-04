
# Tic-Tac-Toe Game in Haskell

This is a simple command-line Tic-Tac-Toe game written in Haskell. Two players (X and O) take turns to place their mark on a 3x3 board. The game continues until one player wins by placing three marks in a row (horizontally, vertically, or diagonally) or until the board is full, resulting in a draw.

## Features

- Two-player game: Player X and Player O.
- Displays the current state of the board after each move.
- Checks for winning conditions and draw scenarios.
- Simple, interactive command-line interface.

## Requirements

- **GHC (Glasgow Haskell Compiler)**

  You can install GHC from the [Haskell website](https://www.haskell.org/platform/) or by using your system's package manager.

## How to Run

1. Clone or download this repository to your local machine.
   
2. Ensure you have GHC installed. If not, you can install it using:

   ```bash
   sudo apt install ghc   # For Ubuntu/Debian
   brew install ghc       # For macOS

## Game Rules

The game is played on a 3x3 grid.

Players take turns to enter their moves. Player X goes first.

Players can input a number from 0-8 to place their mark in the corresponding board position.

The first player to get 3 marks in a row (horizontally, vertically, or diagonally) wins.

If all positions are filled and no one has won, the game ends in a draw.
