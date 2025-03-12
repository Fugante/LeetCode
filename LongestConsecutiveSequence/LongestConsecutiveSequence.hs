import Data.List (sort)
import Data.Set qualified as S

longestConsecutive :: [Int] -> Int
longestConsecutive [] = 0
longestConsecutive nums = max current longest
  where
    (current, longest, _) = foldl go (1, 1, head sorted) $ tail sorted
    sorted = sort nums
    go :: (Int, Int, Int) -> Int -> (Int, Int, Int)
    go (c, l, n0) n
      | n == n0 = (c, l, n)
      | n - n0 <= 1 = (c + 1, l, n)
      | otherwise = (1, max c l, n)

longestConsecutive2 :: [Int] -> Int
longestConsecutive2 [] = 0
longestConsecutive2 nums = foldr go 1 nums
  where
    numsSet = S.fromList nums
    sequenceLength :: Int -> Int -> Int
    sequenceLength c n
      | S.member (n + 1) numsSet = sequenceLength (c + 1) (n + 1)
      | otherwise = c
    go n a
      | S.member (n - 1) numsSet = a
      | otherwise = max a $ sequenceLength 1 n
