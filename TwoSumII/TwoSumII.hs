import Data.Function (on)
import Data.Sequence (Seq (..))
import Data.Sequence qualified as Seq

type Point = (Int, Int)

type Target = Int

_enumerate :: [a] -> [(Int, a)]
_enumerate = zip [0 ..]

_sumSnd :: (a, Int) -> (a, Int) -> Int
_sumSnd = (+) `on` snd

_findIndices :: Target -> Seq Point -> Maybe Point
_findIndices target (nl :<| nr :<| Empty)
  | _sumSnd nl nr == target = Just (fst nl + 1, fst nr + 1)
_findIndices target ((nl :<| ns) :|> nr)
  | _sumSnd nl nr > target = _findIndices target (nl :<| ns)
  | _sumSnd nl nr < target = _findIndices target (ns :|> nr)
  | otherwise = Just (fst nl + 1, fst nr + 1)
_findIndices _ _ = Nothing

twoSum :: [Int] -> Target -> Maybe Point
twoSum numbers target = _findIndices target $ Seq.fromList $ _enumerate numbers
