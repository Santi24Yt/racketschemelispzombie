module Lexer where

import Data.Char

data Token = TkBrO
           | TkBrC
           | TkNum Double
           | TkTrue
           | TkFalse
           | TkAdd
           | TkSub
           | TkMult
           | TkDiv
           | TkAdd1
           | TkSub1
           | TkSqrt
           | TkExpt
           | TkLt
           | TkGt
           | TkEq
           | TkNot
           | TkOr
           | TkAnd 
           | TkLet
           | TkLetS
           | TkId String
           | TkSqBrO
           | TkSqBrC
           | TkLambda
           | TkIf
           | TkCond
           | TkElse
           | TkLetRec
           | TkListC
           | TkHead
           | TkTail
           | TkLength
           | TkReverse
           | TkConcat
           | TkMap
           | TkFilter
           | TkSConcat
           | TkAt
           | TkLsToStr
           | TkTxt String
           
instance Show Token where
  show TkBrO = "("
  show TkBrC = ")"
  show (TkNum n) = show n
  show TkTrue = "#t"
  show TkFalse = "#f"
  show TkAdd = "+"
  show TkSub = "-"
  show TkMult = "*"
  show TkDiv = "/"
  show TkAdd1 = "add1"
  show TkSub1 = "sub1"
  show TkSqrt = "sqrt"
  show TkExpt = "expt"
  show TkLt = "<"
  show TkGt = ">"
  show TkEq = "="
  show TkNot = "not"
  show TkOr = "or"
  show TkAnd = "and"
  show TkLet = "let"
  show TkLetS = "let*"
  show (TkId s) = s
  show TkSqBrO = "["
  show TkSqBrC = "]"
  show TkLambda = "lambda"
  show TkIf = "if"
  show TkCond = "cond"
  show TkElse = "else"
  show TkLetRec = "letrec"
  show TkListC = "list"
  show TkHead = "head"
  show TkTail = "tail"
  show TkLength = "length"
  show TkReverse = "reverse"
  show TkConcat = "concat"
  show TkMap = "map"
  show TkFilter = "filter"
  show TkSConcat = "sconcat"
  show TkAt = "at"
  show TkLsToStr = "lstostr"
  show (TkTxt s) = "\""++s++"\""

errReadDouble :: String -> Maybe (Double, String)
errReadDouble s = case reads s :: [(Double, String)] of
  [(d, s)] -> Just (d, s)
  _        -> Nothing

isNothing :: Maybe a -> Bool
isNothing Nothing = True
isNothing _ = False

readVarName :: String -> (String, String)
readVarName "" = ("", "")
readVarName (fc:rc) 
  | isLetter fc = (nombre, rest2)
  | otherwise = ("", nombre)
  where
    (cumple, rest) = span (\c -> isAlphaNum c || c == '-') rc
    final = if null rest then ' ' else head rest
    (nombre, rest2) = if final == '!' || final == '?' then 
      (fc : cumple ++ [final], tail rest)
    else
      (fc : cumple, rest)

-- putStrLn $ "lexer (" ++ (concatMap (\x -> "'"++[x]++"':") "lstostr") ++ " xs) =  : lexer xs"

lexer :: String -> [Token]
lexer [] = []
lexer ('(' : xs) = TkBrO : lexer xs
lexer (')' : xs) = TkBrC : lexer xs
lexer ('#':'t' : xs) = TkTrue : lexer xs
lexer ('#':'f' : xs) = TkFalse : lexer xs
lexer ('+' : xs) = TkAdd : lexer xs
lexer ('-':' ' : xs) = TkSub : lexer xs
lexer ('*' : xs) = TkMult : lexer xs
lexer ('/' : xs) = TkDiv : lexer xs
lexer ('a':'d':'d':'1' : xs) = TkAdd1 : lexer xs
lexer ('s':'u':'b':'1' : xs) = TkSub1 : lexer xs
lexer ('s':'q':'r':'t' : xs) = TkSqrt : lexer xs
lexer ('e':'x':'p':'t' : xs) = TkExpt : lexer xs
lexer ('<' : xs) = TkLt : lexer xs
lexer ('>' : xs) = TkGt : lexer xs
lexer ('=' : xs) = TkEq : lexer xs
lexer ('n':'o':'t' : xs) = TkNot : lexer xs
lexer ('o':'r' : xs) = TkOr : lexer xs
lexer ('a':'n':'d' : xs) = TkAnd : lexer xs
lexer ('l':'e':'t':'r':'e':'c': xs) = TkLetRec : lexer xs
lexer ('l':'e':'t':'*' : xs) = TkLetS : lexer xs
lexer ('l':'e':'t' : xs) = TkLet : lexer xs
lexer ('[' : xs) = TkSqBrO : lexer xs
lexer (']' : xs) = TkSqBrC : lexer xs
lexer ('l':'a':'m':'b':'d':'a': xs) = TkLambda : lexer xs
lexer ('i':'f': xs) = TkIf : lexer xs
lexer ('c':'o':'n':'d': xs) = TkCond : lexer xs
lexer ('e':'l':'s':'e': xs) = TkElse : lexer xs
lexer ('l':'i':'s':'t': xs) = TkListC : lexer xs
lexer ('h':'e':'a':'d': xs) = TkHead : lexer xs
lexer ('t':'a':'i':'l': xs) = TkTail : lexer xs
lexer ('l':'e':'n':'g':'t':'h': xs) =  TkLength : lexer xs
lexer ('r':'e':'v':'e':'r':'s':'e': xs) = TkReverse : lexer xs
lexer ('c':'o':'n':'c':'a':'t': xs) = TkConcat : lexer xs
lexer ('m':'a':'p': xs) = TkMap : lexer xs
lexer ('f':'i':'l':'t':'e':'r': xs) = TkFilter : lexer xs
lexer ('s':'c':'o':'n':'c':'a':'t': xs) = TkSConcat : lexer xs
lexer ('a':'t': xs) = TkAt : lexer xs
lexer ('l':'s':'t':'o':'s':'t':'r': xs) = TkLsToStr : lexer xs
lexer ('"' : xs) = TkTxt txt : lexer rest
  where
    (txt, rest) = getTxt xs ""
    getTxt (x:xs) acc = 
      if x == '"' then
        (acc, xs)
      else
        getTxt xs (acc++[x])
lexer (' ' : xs) = lexer xs
lexer xs
  | not (isNothing rd) = TkNum num : lexer rest
  | not (null alpha) = TkId alpha : lexer rest2
  | otherwise = error "Lexer error"
  where
    getNum (Just n) = n
    rd = errReadDouble xs
    (num, rest) = getNum rd
    (alpha, rest2) = readVarName xs
