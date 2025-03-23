import Data.Function (on)
import Data.List (sortBy)

carFleet :: Int -> [Int] -> [Int] -> Int
carFleet target position speed = length $ foldl go [] cars
  where
    cars = sortBy (on (flip compare) fst) $ zip position speed
    go :: [Float] -> (Int, Int) -> [Float]
    go [] (p, s) = [on (/) fromIntegral (target - p) s]
    go (t' : ts) (p, s)
      | t <= t' = t' : ts
      | otherwise = t : t' : ts
      where
        t = on (/) fromIntegral (target - p) s
