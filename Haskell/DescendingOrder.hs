
-- https://www.codewars.com/kata/5467e4d82edf8bbf40000155/train/haskell
-- Date:05/11/2021
------------------------------------------------------------------------
-- Original Script Example: 

-- module DescendingOrder where

-- descendingOrder :: Integer -> Integer
-- descendingOrder = error "todo: descendingOrder"




-- Tips: 
--       you will have to extract every digit from that number.
--       put them in array/vector. 
--       sort them out 
--       and then convert it back to int64
------------------------------------------------------------------------

module DescendingOrder where



descendingOrder :: Integer -> Integer
descendingOrder n | n <= 9 = n
                  | n > 10 = 1 --)LISTA-FINAL




{-
--RESULTA MAS TEM QUE SER PASSADA JÁ EM CHAR/STRING
module DescendingOrder where
descendingOrder :: Ord a => [a] -> [a]
descendingOrder = []
descendingOrder (p:xs) = descendingOrder lesser ++ [p] ++ descendingOrder greater
    where
        greater  = filter (< p) xs
        lesser = filter (>= p) xs




--Resulta
module DescendingOrder where
descendingOrder :: [Integer] -> [Integer]
descendingOrder =  reverse 


-}