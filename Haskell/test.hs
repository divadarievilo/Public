import Distribution.Simple.HaskellSuite (getLanguages)
import GHC.Platform (Platform(platformTablesNextToCode), stringEncodeArch)
import Data.Text ()
import Data.Char (toLower, GeneralCategory (UppercaseLetter), isUpper, isUpper, isAlphaNum, isPunctuation, isSymbol, isHexDigit, digitToInt, ord, toUpper)
import System.Directory.Internal.Prelude (RealFloat)
import GHC.Unicode (GeneralCategory(DecimalNumber))

import GHC.Types ( Any )
import Data.List()
import Data.Ord (Down(..), comparing)


import Numeric
import GHC.Float (rationalToDouble)
import Data.Time (TimeOfDay(todHour))
import Text.Printf (IsChar(toChar))
import GHC.Integer.GMP.Internals (sqrInteger)
import GHC.Num.Integer (integerSqr, integerAbs)
import Data.List.NonEmpty (sort)
import GHC.Exts (Down(Down))
import Distribution.Compat.Graph (topSort)
import System.Win32.Automation.Input (sendInputPtr)
import Distribution.Utils.Structured (containerStructure)


doubleMe :: Num a => a -> a
doubleMe x = x + x
-------------------------------------
doubleUs :: Num a => a -> a -> a
doubleUs x y = doubleMe x + y * 2
-------------------------------------
doubleSmallNumber :: (Ord a, Num a) => a -> a
doubleSmallNumber x = if x >= 100 then x else x * 2
-------------------------------------
printHello :: IO ()
printHello = print "Hello!!!"
-------------------------------------
stringHello :: String
stringHello = "Hello!!!"
-------------------------------------
printSomeStuff :: IO ()
printSomeStuff = do putStr "Some "
                    putStrLn "Stuff"
-------------------------------------
makeAFile :: IO ()
makeAFile = do writeFile "C:\\`file.txt" "Some Stuff"
               writeFile "C:\\`file.txt" "Some Other Stuff"
               appendFile "C:\\`file.txt" "Some Other Stuff but appended"
               appendFile "C:\\`file.txt" "Some Other Stuff but appended with new line\nHere."
-------------------------------------
-- Echo the User Input and print´s in a String
echo :: IO ()
echo = do line <- getLine
          print line
-------------------------------------
-- Echo a  file and print´s in a String
echoFile :: IO ()
echoFile = do fileContents <- readFile "C:\\`file.txt"
              putStrLn fileContents -- prints only the content of the text file
              print fileContents -- print a string with the content and formatting of the text file
-------------------------------------
-- Valida se o ano é Bissexto (True) ou não (False).
isLeapYear :: Integer -> Bool
isLeapYear year | (mod year 100 == 0) && (mod year 400 /= 0) = False
                | mod year 4 == 0 = True
                | mod year 100 == 0 = True
                | mod year 400 == 0 = True
                | otherwise = False
-------------------------------------
-- Given an age in seconds, calculate how old someone would be:
data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = case planet of
                            Mercury -> seconds / (0.2408467*(60^2*24*365.25))
                            Venus -> seconds / (0.61519726*(60^2*24*365.25))
                            Earth -> seconds / (1*(60^2*24*365.25))
                            Mars -> seconds / (1.8808158*(60^2*24*365.25))
                            Jupiter -> seconds / (11.862615*(60^2*24*365.25))
                            Saturn -> seconds  / (29.447498*(60^2*24*365.25))
                            Uranus -> seconds / (84.016846*(60^2*24*365.25))
                            Neptune -> seconds / (164.79132*(60^2*24*365.25))
-------------------------------------                



lista :: [Int]
lista = [5,2,10,1,9]

getMenor :: [Int] -> Int
getMenor [x] = x
getMenor (x:xs) | x < getMenor xs = x
                | otherwise = getMenor xs

removeMenor :: [Int] -> [Int]
removeMenor [] = []
removeMenor (x:xs) | x == getMenor (x:xs) = xs
                   | otherwise = x:removeMenor xs

auxOrdena :: [Int] -> [Int] -> [Int]
auxOrdena listaOrdenada [] = listaOrdenada
auxOrdena listaOrdenada (x:xs) = auxOrdena (listaOrdenada++[getMenor (x:xs)]) (removeMenor (x:xs))

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar lista = auxOrdena [] lista

-------------------------------------
-- Determine if a sentence is a pangram
-- IF CONTAINS ALL THE LETTER FROM THE LIST BELOW, RETURN TRUE, ELSE RETURN FALSE 
-- ['A'..'Z']++['a'..'z']  

listaString :: [Char]
listaString = ['A'..'Z']++['a'..'z']

listaTuplas :: [(Char, Char)]
listaTuplas = zip ['A'..'Z'] ['a'..'z']

text :: String
text = "este e um teste"

isPangram :: String -> Bool
isPangram text = True

-------------------------------------
boolToWord :: Bool -> String
boolToWord x | x = "Yes"
             | otherwise = "No"
-------------------------------------
fighter :: String -> String
fighter str | str == "george saint pierre" || str == "George Saint Pierre" || str == "george"  = "I am not impressed by your performance."
            | str == "conor mcgregor" || str == "Conor McGregor" || str == "conor" = "I'd like to take this chance to apologize.. To absolutely NOBODY!"
            | otherwise = ""
-------------------------------------
fighter' :: String -> String
fighter' xs | name == "george saint pierre" = "I am not impressed by your performance."
           | name == "conor mcgregor" = "I'd like to take this chance to apologize.. To absolutely NOBODY!"
           where name = map toLower xs
-------------------------------------
summation :: Integer -> Integer
summation n | n > 1 =  n + summation (n-1)
            | n == 1 = 1
-------------------------------------
solution :: String -> String
solution = reverse
-------------------------------------
numberToString :: Int -> String
numberToString = show
-------------------------------------

solveMeFirst :: Num a => a -> a -> a
solveMeFirst a b = a + b

main :: IO ()
main = do
    val1 <- readLn
    val2 <- readLn
    if val1 < 0 then print "menor" else print "maior"
    let sum = solveMeFirst val1 val2
    print sum


-------------------------------------
evenOrOdd :: Integral a => a -> [Char]
evenOrOdd n = if odd n then "Odd" else "Even"


-------------------------------------
isUpperCase :: String -> Bool
isUpperCase = not . any (`elem` ['a'..'z'])


-- isUpperCase "" = False
-- isUpperCase (x:xs) = (x == ' ' || x == '.' || isUpper x || isPunctuation x || isSymbol x || isHexDigit) && all (\x ->x == ' ' || x == '.' || isUpper x || isPunctuation x || isSymbol x || isHexDigit) xs
-------------------------------------


calculo :: (Read a1, RealFloat a2) => a2 -> a1
calculo n = read ( showFFloat (Just 2) (((n*4) / (2*pi)) ^2) "" )


squareArea :: Double -> Double
squareArea = calculo


--squareArea n = ((n*4) / (2*pi)) ^2
-------------------------------------
correctTail :: String -> Char -> Bool
correctTail bod tail | tail == last bod = True
                     | otherwise = False


-------------------------------------
isSquare :: Integral n => n -> Bool
isSquare n | (round . sqrt $ fromIntegral n) ^ 2 == n = True
           | otherwise = False

-- (a + b)² = a² + 2ab + b²

-- | n^2 == 0 = True
--isSquare n | (n*n) `mod` 2 == 0 = True

-------------------------------------

whoIsPaying :: String -> [String]
whoIsPaying n | n <= take 2 n = [n]
              | otherwise = n : [take 2 n]
--              | otherwise = lines n ++ lines (take 2 n)
-------------------------------------

a :: String
a = "code"
b :: String
b = "wa.rs"
name :: [Char]
name = a ++ b

displayA :: p -> String -> IO ()
displayA a = putStrLn

displayB :: p -> String -> IO ()
displayB b = putStrLn

displayName :: p -> String -> IO ()
displayName name = putStrLn
-------------------------------------

booleanToString :: Bool -> String
booleanToString a | a = "True" | otherwise = "False"



-------------------------------------

makeLowerCase :: [Char] -> [Char]
makeLowerCase = map toLower

-------------------------------------

--descendingOrder :: Integer -> Integer
--descendingOrder n | head n > head (n+1) = [] : n 



-------------------------------------
arrayPlusArray :: [Int]->[Int]->Int
arrayPlusArray xs ys = sum xs + sum ys
-------------------------------------

--
hero :: Int -> Int -> Bool
hero bullets dragons | bullets `div` 2 >= dragons = True
                     | otherwise = False

hero' :: Int -> Int -> Bool
hero' bullets' dragons' | bullets' >= dragons' * 2 = True
                        | otherwise = False
-------------------------------------

-- Remove LAST exclamation mark from the end of sentence.
remove :: String -> String
remove sentence | sentence == "" = sentence
                | last sentence == '!' =  reverse (drop 1 (reverse sentence))
                | otherwise = sentence
{-
remove :: String -> String
remove "" = ""
remove s  = if last s == '!' then init s else s
-}
-------------------------------------

--
xor :: Bool -> Bool -> Bool
xor a b | a == b || b == a = False
        | otherwise = True

-------------------------------------

-- Remove ALL exclamation marks from the end of sentence.
removeAll :: String -> String
removeAll str | str == "" = str
                | last str == '!' = removeAll (reverse (drop 1 (reverse str)))
                | otherwise = str
-------------------------------------

-- Make numeber always negative
makeNegative :: (Num a, Ord a) => a -> a
makeNegative n | n > 0 = negate n
               | otherwise = n
-------------------------------------

-- Write a function that will take the number of petals of each flower and return true if they are in love and false if they aren't.
inlove :: Int -> Int -> Bool
inlove a b | a /= b && (odd a && even b) = True
           | a /= b && (even a && odd b) = True
           | otherwise = False
-------------------------------------

-- Crate a list betweem the input of two numbers
between :: Integer -> Integer -> [Integer]
between a b | a < b = [a..b]
-------------------------------------
-- Substituir uma letra por outra letra ou Char
dnaToRna :: String -> String
dnaToRna xs = [ if x == 'T' then 'U' else x | x <- xs]
-------------------------------------
-- Numeros Pequenos 
oddCount :: Int -> Int
oddCount x = if odd x then length [1,3..x] - 1 else x

-- Numeros Grandes
oddCount' :: Int -> Int
oddCount' x | odd x && x < 1000000 = length [1,3..x]  -1
            | x > 1000000 = x `div` 2
            | otherwise = x

-------------------------------------
--
solution2 :: String -> String
solution2 xs = [  if y `elem` ['A'..'Z'] then ' '  else y  |  y <- xs ]



-- if x `elem` ['A'..'Z'] then ' ' else x
-- solution2 xs = [ if x `elem` ['A'..'Z'] then ' ' else x |  x <- xs, x `elem` ['A'..'Z'] ]  

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------
{-

Links Uteis:

    -> Operators: https://imada.sdu.dk/~rolf/Edu/DM22/F06/haskell-operatorer.pdf



-}