import Data.List (intercalate)

type Board = [Char]

-- Initialize an empty board
initialBoard :: Board
initialBoard = replicate 9 ' '

-- Display the board
displayBoard :: Board -> IO ()
displayBoard board = do
    putStrLn $ intercalate "\n---------\n" [intercalate " | " (map pure row) | row <- rows]
  where
    rows = chunksOf 3 board

-- Split the list into chunks
chunksOf :: Int -> [a] -> [[a]]
chunksOf _ [] = []
chunksOf n xs = take n xs : chunksOf n (drop n xs)

-- Check if a player has won
checkWin :: Board -> Char -> Bool
checkWin board player = any (all (== player)) winningPositions
  where
    winningPositions = [[board !! 0, board !! 1, board !! 2],
                        [board !! 3, board !! 4, board !! 5],
                        [board !! 6, board !! 7, board !! 8],
                        [board !! 0, board !! 3, board !! 6],
                        [board !! 1, board !! 4, board !! 7],
                        [board !! 2, board !! 5, board !! 8],
                        [board !! 0, board !! 4, board !! 8],
                        [board !! 2, board !! 4, board !! 6]]

-- Check if the board is full (draw condition)
boardFull :: Board -> Bool
boardFull = all (/= ' ')

-- Make a move on the board
makeMove :: Board -> Int -> Char -> Board
makeMove board pos player =
    take pos board ++ [player] ++ drop (pos + 1) board

-- Main game loop
gameLoop :: Board -> Char -> IO ()
gameLoop board player = do
    displayBoard board
    if checkWin board (switchPlayer player)
      then putStrLn $ "Player " ++ [switchPlayer player] ++ " wins!"
      else if boardFull board
           then putStrLn "It's a draw!"
           else do
               putStrLn $ "Player " ++ [player] ++ ", enter your move (0-8): "
               pos <- getLine
               let pos' = read pos :: Int
               if pos' < 0 || pos' > 8 || board !! pos' /= ' '
                 then do
                     putStrLn "Invalid move, try again."
                     gameLoop board player
                 else gameLoop (makeMove board pos' player) (switchPlayer player)

-- Switch between players
switchPlayer :: Char -> Char
switchPlayer 'X' = 'O'
switchPlayer 'O' = 'X'

-- Start the game
startGame :: IO ()
startGame = do
    putStrLn "Welcome to Tic-Tac-Toe!"
    gameLoop initialBoard 'X'

-- Entry point for the program
main :: IO ()
main = startGame
