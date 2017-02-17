primeFactors n =
  if (getFactors n) == []
  then [n]
  else (primeFactors (head $ getFactors n)) ++ (primeFactors (n `div` (head $ getFactors n)))

ceilSqrt = ceiling . sqrt

isInt n = n == fromInteger (round n) 

-- search for factors of n from x to y
searchFactors :: Integral a => a -> a -> a -> [a]
searchFactors n x y
  | (x == y+1) = []
  | (((n `div` x)*x) == n) && (n/=x) = [x] ++ searchFactors n (x+1) y
  | otherwise = searchFactors n (x+1) y

-- this functions typing is inconvient to use
searchFactors' n x y
  | (x == y+1) = [n]
  | isInt (n / x) && (n/=x) = [x] ++ searchFactors' n (x+1) y
  | otherwise = searchFactors' n (x+1) y

isPrime n = [] == (getFactors n)

getFactors n = searchFactors n 2 (ceilSqrt $ fromIntegral n) 

main = do 
  --print $ ceilSqrt 15
  --print $ searchFactors 15 1 (ceilSqrt 15)
  putStrLn "The following is the factors of primes 2, 3, 5, 7, 11, 13, 17, 19. Should be empty of course"
  print $ map getFactors [2, 3, 5, 7, 11, 13, 17, 19]
  
  putStrLn "The following is the factors of composite numbers 4, 6, 8, 9, 10, 12, 14, 15"
  print $ map getFactors [4, 6, 8, 9, 10, 12, 14, 15]
  
  putStrLn "The prime factorization of 156204860 is:"
  print $ primeFactors 156204860
  
  putStrLn "The largest prime factor of 600851475143 is:"
  print $ maximum (primeFactors 600851475143)
