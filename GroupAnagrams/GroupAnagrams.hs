import Data.List (sort)
import Data.Map qualified as M

type StrsMap = M.Map String [String]

groupAnagrams :: [String] -> [[String]]
groupAnagrams strs = M.foldr (:) [] anagramsMap
  where
    anagramsMap = foldr go M.empty strs
    go :: String -> StrsMap -> StrsMap
    go s m = M.insert k v m
      where
        k = sort s
        v = maybe [s] (++ [s]) (M.lookup k m)
