{
module Parser where

import Lexer

import Data.List
}

%name parser
%tokentype { Token }
%error { parseError }

{- Definición de los tokens -}

%token
  '('   { TkBrO }
  ')'   { TkBrC }
  num   { TkNum $$ }
  '#t'    { TkTrue }
  '#f'    { TkFalse }
  '+'   { TkAdd }
  '-'   { TkSub }
  '*'   { TkMult }
  '/'   { TkDiv }
  add1  { TkAdd1 }
  sub1  { TkSub1 }
  sqrt  { TkSqrt }
  expt  { TkExpt }
  '<'   { TkLt }
  '>'   { TkGt }
  '='   { TkEq }
  not   { TkNot }
  or    { TkOr }
  and   { TkAnd }
  let   { TkLet }
  'let*'  { TkLetS }
  var   { TkId $$ }
  '['   { TkSqBrO }
  ']'   { TkSqBrC }
  lambda { TkLambda }
  if    { TkIf }
  cond  { TkCond }
  else  { TkElse }
  letrec { TkLetRec }
  list { TkListC }
  head { TkHead }
  tail { TkTail }
  length { TkLength }
  reverse { TkReverse }
  concat { TkConcat }
  map { TkMap }
  filter { TkFilter }
  sconcat { TkSConcat }
  at { TkAt }
  lstostr { TkLsToStr }
  str { TkTxt $$ }

%%

{- Definición de la sintaxis concreta -}

expr : num      { SNum $1 }
     | '#t'     { SBoolean Tr }
     | '#f'     { SBoolean Fl }
     | '(' '+' seq ')' { SAdd $3 }
     | '(' '-' seq ')' { SSub $3 }
     | '(' '*' seq ')' { SMult $3 }
     | '(' '/' seq ')' { SDiv $3 }
     | '(' add1 expr ')' { SAdd1 $3 }
     | '(' sub1 expr ')' { SSub1 $3 }
     | '(' sqrt expr ')' { SSqrt $3 }
     | '(' expt expr expr ')' { SExpt $3 $4 }
     | '(' '<' seq ')'  { SLt $3 }
     | '(' '>' seq ')'  { SGt $3 }
     | '(' '=' seq ')'  { SEq $3 }
     | '(' not expr ')'  { SNot $3 }
     | '(' or seq ')'  { SOr $3 }
     | '(' and seq ')' { SAnd $3 }
     | '(' let '(' seq2 ')' expr ')' { SLet $4 $6 }
     | '(' 'let*' '(' seq2 ')' expr ')' { SLetS $4 $6 }
     | var { SId $1 }
     | '(' lambda '(' seq3 ')' expr ')' { SLambda $4 $6 }
     | '(' expr seq ')' { SApp $2 $3 }
     | '(' if expr expr expr ')' { SIf $3 $4 $5 }
     | '(' cond '(' seq4 ')' '(' else expr ')' ')' { SCond $4 $8 }
     | '(' letrec '(' var expr ')' expr ')' { SLetRec (SId $4) $5 $7 }
     | '(' list seq5 ')'  { SListC $3 }
     | '(' head expr ')'     { SHead $3 }
     | '(' tail expr ')'     { STail $3 }
     | '(' length expr ')'   { SLength $3 }
     | '(' reverse expr ')'   { SReverse $3 }
     | '(' concat seq ')'   { SConcat $3 }
     | '(' map expr expr ')'   { SMap $3 $4 }
     | '(' filter expr expr ')'   { SFilter $3 $4 }
     | '(' sconcat seq ')'   { SConcatS $3 }
     | '(' at expr expr ')'   { SAt $3 $4 }
     | '(' lstostr expr ')'     { SLsToStr $3 }
     | str { SString $1 }

seq : expr        { [$1] }
    | expr seq    { $1 : $2 }

seq2 : '[' var expr ']'  { [(SId $2, $3)] }
     | '[' var expr ']' seq2 { (SId $2, $3) : $5 }

seq3 : var        { [(SId $1)] }
     | var seq3   { (SId $1) : $2 }

seq4 : {- empty -}    { [] }
     | '[' expr expr ']' seq4 { ($2, $3) : $5 }

seq5 : {- empty -}   { [] }
     | expr seq5     { $1 : $2 }

{

parseError :: [Token] -> a
parseError x = error "Parse error"

-- No sé si así están bien los booleanos pero así se me ocurrió implementarlos y parece que funciona bien
data Bl = Tr | Fl

data SASA = SNum Double
         | SBoolean Bl
         | SAdd [SASA]
         | SSub [SASA]
         | SMult [SASA]
         | SDiv [SASA]
         | SAdd1 SASA
         | SSub1 SASA
         | SSqrt SASA
         | SExpt SASA SASA
         | SLt [SASA]
         | SGt [SASA]
         | SEq [SASA]
         | SNot SASA
         | SOr [SASA]
         | SAnd [SASA]
         | SId String
         | SLet [(SASA, SASA)] SASA
         | SLetS [(SASA, SASA)] SASA
         | SLambda [SASA] SASA
         | SApp SASA [SASA]
         | SIf SASA SASA SASA
         | SCond [(SASA, SASA)] SASA
         | SLetRec SASA SASA SASA
         | SListC [SASA]
         | SHead SASA
         | STail SASA
         | SLength SASA
         | SReverse SASA
         | SConcat [SASA]
         | SMap SASA SASA
         | SFilter SASA SASA
         | SConcatS [SASA]
         | SAt SASA SASA
         | SLsToStr SASA
         | SString String

intercala :: [String] -> String -> [String]
intercala [x] _ = [x]
intercala (x:xs) s = [x] ++ [s] ++ intercala xs s

showlsasa :: [SASA] -> String
showlsasa [] = ""
showlsasa lsasa = concat (intercala (map show lsasa) " ")

showlsasatup :: [(SASA, SASA)] -> String
showlsasatup [] = ""
showlsasatup lsasa = concat (intercala (map (\(x, y) -> "["++show x++" "++show y++"]") lsasa) " ")

showsvars :: [(SASA, SASA)] -> String
showsvars [] = ""
showsvars vars = concat (intercala (map (\(var, val) -> "[" ++ show var ++ " " ++ show val ++ "]") vars) " ")

instance Show SASA where
  show (SNum n) = show n
  show (SBoolean Tr) = "#t"
  show (SBoolean Fl) = "#f"
  show (SAdd lasa) = "(+ " ++ showlsasa lasa ++ ")"
  show (SSub lasa) = "(- " ++ showlsasa lasa ++ ")"
  show (SMult lasa) = "(* " ++ showlsasa lasa ++ ")"
  show (SDiv lasa) = "(/ " ++ showlsasa lasa ++ ")"
  show (SAdd1 asa) = "(add1 " ++ show asa ++ ")"
  show (SSub1 asa) = "(sub1 " ++ show asa ++ ")"
  show (SSqrt asa) = "(sqrt " ++ show asa ++ ")"
  show (SExpt asa1 asa2) = "(expt " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (SLt lasa) = "(< " ++ showlsasa lasa ++ ")"
  show (SGt lasa) = "(> " ++ showlsasa lasa ++ ")"
  show (SEq lasa) = "(= " ++ showlsasa lasa ++ ")"
  show (SNot asa) = "(not " ++ show asa ++ ")"
  show (SOr lasa) = "(or " ++ showlsasa lasa ++ ")"
  show (SAnd lasa) = "(and " ++ showlsasa lasa ++ ")"
  show (SLet vars asa) = "(let (" ++ showsvars vars  ++ ")" ++ " " ++ show asa ++ ")"
  show (SLetS vars asa) = "(let* (" ++ showsvars vars  ++ ")" ++ " " ++ show asa ++ ")"
  show (SId var) = var
  show (SLambda lasa asa) = "(lambda (" ++ showlsasa lasa ++ ") " ++ show asa ++ ")"
  show (SApp asa lasa) = "(" ++ show asa ++ " " ++ showlsasa lasa ++ ")"
  show (SIf asa1 asa2 asa3) = "(if " ++ show asa1 ++ " " ++ show asa2 ++ " " ++ show asa3 ++ ")"
  show (SCond lasa asa) = "(cond (" ++ showsvars lasa ++ ") (else " ++ show asa ++ "))"
  show (SLetRec id val asa) = "(letrec (" ++ show id ++ " " ++ show val ++ ")" ++ " " ++ show asa ++ ")"
  show (SListC lasa) = "(list "++ showlsasa lasa ++")"
  show (SHead asa) = "(head "++show asa++")"
  show (STail asa) = "(tail "++show asa++")"
  show (SLength asa) = "(length "++show asa++")"
  show (SReverse asa) = "(reverse "++show asa++")"
  show (SConcat lasa) = "(concat "++showlsasa lasa++")"
  show (SMap asa1 asa2) = "(map "++show asa1++" "++show asa2++")"
  show (SFilter asa1 asa2) = "(filter "++show asa1++" "++show asa2++")"
  show (SConcatS lasa) = "(sconcat "++showlsasa lasa++")"
  show (SAt asa1 asa2) = "(at "++show asa1++" "++show asa2++")"
  show (SLsToStr asa) = "(lstostr "++show asa++")"
  show (SString s) = "\""++s++"\""

}
