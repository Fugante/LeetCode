import Data.Map qualified as M

type IntegerMap = M.Map Integer Integer

twoSum :: [Integer] -> Integer -> [Integer]
twoSum nums target = go 0 M.empty nums
  where
    go :: Integer -> IntegerMap -> [Integer] -> [Integer]
    go _ _ [] = []
    go c m (n : ns)
      | M.member t' m = [m M.! t', c]
      | otherwise = go (c + 1) (M.insert n c m) ns
      where
        t' = target - n

main :: IO ()
main = do
  let nums = [3, 2, 4]
      indices = twoSum nums 6
  print indices
