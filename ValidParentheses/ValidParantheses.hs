import Data.Map qualified as M
import Data.Maybe (maybe)

symbols = M.fromList [(')', '('), (']', '['), ('}', '{')]

isValid :: String -> Bool
isValid = go ""
  where
    go :: String -> String -> Bool
    go "" "" = True
    go t "" = False
    go "" (s : ss)
      | s `elem` M.elems symbols = go (s : "") ss
      | otherwise = False
    go (t : ts) (s : ss)
      | s `elem` M.elems symbols = go (s : (t : ts)) ss
      | Just t == M.lookup s symbols = go ts ss
      | otherwise = False
