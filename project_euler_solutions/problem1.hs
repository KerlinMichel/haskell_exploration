divBy num [] = False

divBy num (n:nums) 
  | num `mod` n == 0 = True
  | otherwise = divBy num nums

main = do
  let mul3_5 = [x | x <- [0..999], divBy x [3, 5]]
  putStrLn "The sum of all the multiples of 3 or 5 below 1000 is:"
  print $ sum mul3_5
