-- Implementing root caclulations with binary search

realEq val1 val2 delta
  | abs(val1 - val2) < delta = True
  | otherwise = False

squareRoot num delta = squareRootRec 0 num num delta

squareRootRec beg end val delta
  | realEq (middle*middle) val delta = middle
  | (middle*middle) > val = squareRootRec beg middle val delta
  | (middle*middle) < val = squareRootRec middle end val delta
  where middle = beg + ((end - beg)/2)

root n num delta = rootRec n 0 num num  delta

rootRec n beg end val delta
  | realEq (middle**n) val delta = middle
  | (middle**n) > val = rootRec n beg middle val delta
  | (middle**n) < val = rootRec n middle end val delta
  where middle = beg + ((end - beg)/2)

main = do
  putStrLn "The square root of 25 is approx.:"
  let sqr = squareRoot 25.0 0.01
  print sqr

  putStrLn "The cubed root of 27 is approx.:"
  let r = root 3.0 27.0 0.01
  print r
