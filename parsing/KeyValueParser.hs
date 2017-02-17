-- ref: http://book.realworldhaskell.org/read/using-parsec.html

import Text.ParserCombinators.Parsec

keyValueFile :: GenParser Char st [[String]]
keyValueFile =
  do result <- many line
     eof
     return result

line :: GenParser Char st [String]
line = 
  do result <- keyValue
     eol
     return result

keyValue :: GenParser Char st [String]
keyValue =
  do key <- many letter
     char '='
     value <- many (noneOf "\n")
     return [key, value]

eol :: GenParser Char st Char
eol = char '\n'

parseKeyValue :: String -> Either ParseError [[String]]
parseKeyValue input = parse keyValueFile "Parse Error" input

main =
  do print $ parseKeyValue "HELLO=World\nLANG=HASKELL!\n"
