import Data.Char (ord)

replace :: [a] -> Int -> a -> [a]
replace l n a = ln ++ a : ls
  where
    (ln, _ : ls) = splitAt n l

validAnagram :: String -> String -> Bool
validAnagram s t = all (== 0) tCount
  where
    count = replicate 26 0
    sCount = foldr (f (+ 1)) count s
    tCount = foldr (f (subtract 1)) sCount t
    f :: (Int -> Int) -> Char -> [Int] -> [Int]
    f g c is = replace is i (g $ is !! i)
      where
        i = ord c - ord 'a'
