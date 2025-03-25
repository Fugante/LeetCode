import Data.Char (isAlpha, toLower)
import Data.Sequence (Seq (..), fromList)

_toLowerAlpha :: String -> Seq Char
_toLowerAlpha = fromList . map toLower . filter isAlpha

_validatePalindrome :: Seq Char -> Bool
_validatePalindrome Empty = True
_validatePalindrome (c :<| Empty) = True
_validatePalindrome ((c :<| cs) :|> c')
  | c == c' = _validatePalindrome cs
  | otherwise = False

isPalindrome :: String -> Bool
isPalindrome = _validatePalindrome . _toLowerAlpha
