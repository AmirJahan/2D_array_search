# 2D_array_search

A simple Swift project demonstrating a 2D array search, with a focus on visualization rather than performance.

## Getting Started

1.  Run the app.
2.  Rotate the simulator (CMD + Left).
3.  Re-run the app.

## System Requirements

Optimized for iPad 10th generation.

## Core Concepts

This project visualizes the process of searching for a specific sequence of characters (a "word") within a 2D grid of randomly generated letters. The core idea is to represent a common search problem in a visual and understandable way, focusing on the steps involved rather than raw algorithmic speed.

Key concepts include:

*   **2D Grid:** A fundamental data structure representing a matrix of elements (in this case, characters).
*   **Search Word:** The target sequence of characters we aim to find within the grid.
*   **Traversal:** The method used to move through the grid to compare characters and identify potential matches for the search word.
*   **Visualization:** Highlighting the search path and matched characters to provide clear feedback on the algorithm's progress.


## Visualization

![Animated sequence of a search on a grid of 10 by 10. Each cell in the grid represents one letter at random. We are interested in finding a sequnce of 4 characters that represent the word RAFA](https://github.com/AmirJahan/2D_array_search/blob/main/2D_Array_Search.gif)

## How to Use

## How It Works

The application initializes a 2D grid with random letters. When a search word is provided, the system iterates through each cell of the grid. From each cell, it attempts to match the search word by checking adjacent cells in all eight directions (horizontally, vertically, and diagonally). The visualization highlights the current search path and any successful matches. This process continues until all possible starting points in the grid have been explored.

*   **Grid Size:** Adjust the grid dimensions in `AppData.swift`.
*   **Search Word:** Modify the search word in `AppData.swift`.
    *   **Note:** The search word must be exactly 4 characters long due to visualization limitations.
*   **Manual Sequence Insertion:** Use the `ViewModel.swift` to manually insert sequences of interest.