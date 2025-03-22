generateParentheses :: Int -> [String]
generateParentheses = go "" 0
  where
    go :: String -> Int -> Int -> [String]
    go "" o n
      | n > 0 = go ")" (o + 1) (n - 1)
      | otherwise = []
    go s o n = case (o > 0, n > 0) of
      (True, True) -> go (')' : s) (o + 1) (n - 1) ++ go ('(' : s) (o - 1) n
      (True, False) -> go ('(' : s) (o - 1) n
      (False, True) -> go (')' : s) (o + 1) (n - 1)
      _ -> [s]
