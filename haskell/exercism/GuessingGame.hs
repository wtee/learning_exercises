module GuessingGame (reply) where

reply :: Int -> String
reply guess
    | 42 == guess              = "Correct" 
    | 40 < guess && guess < 44 = "So close"
    | 41 > guess               = "Too low"
    | 43 < guess               = "Too high"
