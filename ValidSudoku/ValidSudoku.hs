import Data.Char (isDigit)
import Data.Set qualified as S

type IntSet = S.Set Int

parseCell :: Char -> Int
parseCell c
  | isDigit c = read [c]
  | otherwise = 0

replace :: Int -> a -> [a] -> [a]
replace i a l
  | i + 1 > length l = error "Index error"
  | otherwise = take i l ++ (a : drop (i + 1) l)

validSudoku :: [String] -> Bool
validSudoku = go (0, 0) S.empty columnSets squareSets
  where
    columnSets = [S.empty | _ <- [1 .. 9]] :: [IntSet]
    squareSets = [S.empty | _ <- [1 .. 9]] :: [IntSet]
    go :: (Int, Int) -> IntSet -> [IntSet] -> [IntSet] -> [String] -> Bool
    go _ _ _ _ [] = True
    go (m, n) s colSets sqrSets ([] : rs) = go (m + 1, 0) S.empty colSets sqrSets rs
    go (m, n) s colSets sqrSets ((cell : cells) : rs)
      | d == 0 = go (m, n + 1) s colSets sqrSets (cells : rs)
      | S.member d s = False
      | S.member d (colSets !! n) = False
      | S.member d (sqrSets !! i) = False
      | otherwise = go (m, n + 1) (S.insert d s) colSets' sqrSets' (cells : rs)
      where
        d = parseCell cell
        i = div n 3 + (3 * div m 3)
        colSet = S.insert d $ colSets !! n
        sqrSet = S.insert d $ sqrSets !! i
        colSets' = replace n colSet colSets
        sqrSets' = replace i sqrSet sqrSets
