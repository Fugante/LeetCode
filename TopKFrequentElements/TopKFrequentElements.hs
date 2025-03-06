import Data.List qualified as L
import Data.Map qualified as M

topKFrequentElements :: [Int] -> Int -> [Int]
topKFrequentElements nums k = take k $ fst <$> sortedFreqs
  where
    sortedFreqs = L.sortBy (\(_, f1) (_, f2) -> compare f2 f1) freqs
    freqs = M.toList $ foldr go M.empty nums
    go :: Int -> M.Map Int Int -> M.Map Int Int
    go n = M.insertWith (+) n 1

replace :: [a] -> Int -> a -> [a]
replace as n a = a0 ++ a : af
  where
    (a0, _ : af) = L.splitAt n as

topKFrequentElements2 :: [Int] -> Int -> [Int]
topKFrequentElements2 nums k = take k $ concat freq
  where
    freq = foldr go [[] | _ <- [1 .. len + 1]] (M.toList count)
    go :: (Int, Int) -> [[Int]] -> [[Int]]
    go (n, f) ns = replace ns (len - f) (ns !! (len - f) ++ [n])
    len = length nums
    count = foldr go' M.empty nums
    go' :: Int -> M.Map Int Int -> M.Map Int Int
    go' n = M.insertWith (+) n 1
