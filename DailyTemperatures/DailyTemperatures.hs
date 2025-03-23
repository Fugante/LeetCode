type IndexedList = [(Int, Int)]

replace :: Int -> a -> [a] -> [a]
replace i a as = take i as ++ (a : drop (i + 1) as)

dailyTemperatures :: [Int] -> [Int]
dailyTemperatures temperatures = snd $ foldl go ([], results) idxTemps
  where
    results = replicate (length temperatures) 0
    idxTemps = zip temperatures [0 ..]
    go :: (IndexedList, [Int]) -> (Int, Int) -> (IndexedList, [Int])
    go ([], rs) ti = ([ti], rs)
    go ((t', i') : tis, rs) (t, i)
      | t > t' = go (tis, replace i' (i - i') rs) (t, i)
      | otherwise = ((t, i) : (t', i') : tis, rs)
