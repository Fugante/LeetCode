productsOfArrayExceptSelf :: [Int] -> [Int]
productsOfArrayExceptSelf [] = []
productsOfArrayExceptSelf nums = zipWith (*) suffixProduct prefixProduct
  where
    prefixProduct = scanl (*) 1 (init nums)
    suffixProduct = scanr (*) 1 (tail nums)
