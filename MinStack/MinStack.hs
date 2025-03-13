data MinStack = MinStack {stack :: [Int], _minStack :: [Int]} deriving (Show)

empty :: MinStack
empty = MinStack [] []

push :: Int -> MinStack -> MinStack
push i (MinStack [] []) = MinStack [i] [i]
push i (MinStack (s : ss) (m : ms)) =
  MinStack (i : s : ss) (min i m : m : ms)

pop :: MinStack -> MinStack
pop (MinStack [] []) = MinStack [] []
pop (MinStack (s : ss) (m : ms)) = MinStack ss ms

top :: MinStack -> Int
top (MinStack [] []) = error "Empty stack"
top (MinStack (s : _) _) = s

getMin :: MinStack -> Int
getMin (MinStack [] []) = error "Empty stack"
getMin (MinStack _ (m : _)) = m
