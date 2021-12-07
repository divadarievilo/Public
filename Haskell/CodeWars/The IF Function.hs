{-
https://www.codewars.com/kata/54147087d5c2ebe4f1000805/train/haskell

ORIGINAL CODE:

    module If where

    _if :: Bool -> a -> a -> a
    _if b x y = undefined

-}

module If where

_if :: Bool -> a -> a -> a
_if b x y = if b then x else y
