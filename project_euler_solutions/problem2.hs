fibHelperLim preval val lim
  | (preval+val) > lim = []
  | odd $ preval+val = fibHelperLim val (preval+val) lim
  | otherwise = fibHelperLim val (preval+val) lim ++ [(preval+val)]

fibArray lim = fibHelperLim 0 1 lim

main = do
  let fs = fibArray 4000000
  putStrLn "The even fibonacci numbers up to a value of 4 million are:"
  print $ reverse $ fs
  putStrLn "The sum of that result is:"
  print $ sum $ fs
