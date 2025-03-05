import Data.Set qualified as Set

containsDuplidate :: [Integer] -> Bool
containsDuplidate = go Set.empty
  where
    go :: Set.Set Integer -> [Integer] -> Bool
    go _ [] = False
    go s (n : ns)
      | Set.member n s = True
      | otherwise = go (Set.insert n s) ns

main :: IO ()
main = do
  let nums = [1, 2, 3, 4]
      answer = containsDuplidate nums
  print answer
