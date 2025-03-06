import Data.Char (chr, ord)

encode :: [String] -> String
encode strs = header ++ replicate (100 - length header) '\0' ++ concat strs
  where
    header = foldr (\str acc -> chr (length str) : acc) "" strs

decode :: String -> [String]
decode s = go header strings []
  where
    header = take 100 s
    strings = drop 100 s
    go :: [Char] -> String -> [String] -> [String]
    go _ [] a = a
    go (h : hs) ss a = go hs m (a ++ [s'])
      where
        n = ord h
        (s', m) = splitAt n ss
