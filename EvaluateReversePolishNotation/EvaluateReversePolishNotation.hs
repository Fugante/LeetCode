import Data.Char (isDigit)
import Data.Map qualified as M

errorMsg = error "Parse error. Invalid expresion"

operators = M.fromList [("+", (+)), ("-", (-)), ("*", (*)), ("/", quot)]

evalRPN :: [String] -> Int
evalRPN = head . foldl go []
  where
    go :: [Int] -> String -> [Int]
    go [] t = [read t]
    go [i] t = [read t, i]
    go (i : i' : is) t =
      maybe (read t : i : i' : is) (\o -> o i' i : is) (M.lookup t operators)
