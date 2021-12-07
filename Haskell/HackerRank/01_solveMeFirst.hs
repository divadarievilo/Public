

solveMeFirst :: Num a => a -> a -> a
solveMeFirst a b = a + b

main :: IO ()
main = do
    val1 <- readLn
    val2 <- readLn
        
    if ((val1 > 0 && val1 < 1000) && (val2 > 0 && val2 < 1000))
        then let sum = solveMeFirst val1 val2
        else let sum = 0