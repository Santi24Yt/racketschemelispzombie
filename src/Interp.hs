module Interp where

import Desugar
import Parser
import Lexer

import Debug.Trace

data Value = NumV Double
           | BooleanV Bool
           | Cerr String ASA Env
           | VASA ASA Env
           | ListV [Value]
           | StringV String

type Env = [(String,Value)]

num :: Value -> Double
num (NumV n) = n
num _ = error "Error: no es número"

bool :: Value -> Bool
bool (BooleanV True) = True
bool (BooleanV False) = False
bool _ = error "Error: no es booleano"

str :: Value -> String
str (StringV s) = s
str _ = error "Error: no es string"

lst :: Value -> [Value]
lst (ListV lv) = lv
lst _ = error "Error: no es lista"

showlv :: [Value] -> String
showlv [] = ""
showlv lv = concat (intercala (map show lv) " ")

instance Show Value where
  show (NumV n) = show n
  show (BooleanV True) = "#t"
  show (BooleanV False) = "#f"
  show (Cerr var cuerp env) = "#<procedure> <"++var++", "++show cuerp++", "++show env++">"
  show (VASA asa env) = "#<vasa> <"++show asa ++ " :: " ++show env++">"
  show (ListV lv) = "'("++showlv lv++")"
  show (StringV s) = "\""++s++"\""

{-
data ASA = Num Double
         | Boolean Bl
         | Add ASA ASA
         | Sub ASA ASA
         | Mult ASA ASA
         | Div ASA ASA
         | Add1 ASA
         | Sub1 ASA
         | Sqrt ASA
         | Expt ASA ASA
         | Lt ASA ASA
         | Gt ASA ASA
         | Eq ASA ASA
         | Not ASA
         | Or ASA ASA
         | And ASA ASA
         | Id String
         | Lambda ASA ASA
         | App ASA ASA
         | If ASA ASA ASA
         | ListC [ASA]
         | Head ASA
         | Tail ASA
         | Length ASA
         | Reverse ASA
         | Concat ASA ASA
         | Map ASA ASA
         | Filter ASA ASA
         | ConcatS ASA ASA
         | At ASA ASA
         | LsToStr ASA
         | AString String
-}

y :: Value
y = interp (desugar $ parser $ lexer "(lambda (f) ((lambda (x) (f (x x))) (lambda (x) (f (x x)))))") []

{- HLINT ignore "Avoid lambda" -}
interp :: ASA -> Env -> Value
interp (Num n) env = NumV n
interp (Boolean Tr) env = BooleanV True
interp (Boolean Fl) env = BooleanV False
--
interp (Add1 e) env = NumV (1 + num (strict (interp e env)))
interp (Sub1 e) env = NumV (num (strict (interp e env)) - 1)
interp (Sqrt e) env = NumV (sqrt (num (strict (interp e env))))
interp (Expt e1 e2) env = NumV (num (strict (interp e1 env)) ** num (strict (interp e2 env)))

interp (Add asa1 asa2) env = NumV (num (strict (interp asa1 env)) + num (strict (interp asa2 env)))
interp (Sub asa1 asa2) env = NumV (num (strict (interp asa1 env)) - num (strict (interp asa2 env)))
interp (Mult asa1 asa2) env = NumV (num (strict (interp asa1 env)) * num (strict (interp asa2 env)))
interp (Div asa1 asa2) env = NumV (num (strict (interp asa1 env)) / num (strict (interp asa2 env)))

interp (Lt asa1 asa2) env = BooleanV (num (strict (interp asa1 env)) < num (strict (interp asa2 env)))
interp (Gt asa1 asa2) env = BooleanV (num (strict (interp asa1 env)) > num (strict (interp asa2 env)))
interp (Eq asa1 asa2) env = BooleanV (num (strict (interp asa1 env)) == num (strict (interp asa2 env)))

interp (Not asa) env = BooleanV (not $ bool (strict (interp asa env)))

interp (Or asa1 asa2) env = BooleanV (bool (strict (interp asa1 env)) || bool (strict (interp asa2 env)))
interp (And asa1 asa2) env = BooleanV (bool (strict (interp asa1 env)) && bool (strict (interp asa2 env)))

interp (Id "Y") env = y
interp (Id var) env =
  if isNothing val then 
    error ("Error de variable libre (?) "++show var)
  else
    case rmj val of
      (VASA asav envv) -> interp asav envv
      _ -> rmj val
  where
    val = lookup var env

interp (If c t e) env = 
  if bool c' then
    interp t env
  else
    interp e env
  where
    c' = strict (interp c env)

interp (Lambda (Id var) asa) env = Cerr var asa env

interp (App asa1 asa2) env = interp exp nenv
  where
    cerr = interp asa1 env
    (Cerr p exp oenv) = strict cerr
    nenv = (p, VASA asa2 env):oenv

interp (ListC lasa) env = ListV (map (\x -> interp x env) lasa)

-- No es eficiente aplicarle strict a toda la lista pero técnicamente la especificación formal
-- pide que se le aplique strict al argumento, se usará la versión que no aplica strict a toda la lista
-- interp (Head l) env = head (lst lv)
--   where
--     a = interp l env
--     lv = strict a
interp (Head l) env = r
  where
    a = interp l env
    lv = lst a
    r = strict (head lv)

interp (Tail l) env = ListV (tail (lst lv))
  where
    lv = interp l env

interp (Length l) env = NumV (fromIntegral (length (lst lv)) :: Double)
  where
    lv = interp l env

interp (Reverse l) env = ListV (reverse (lst lv))
  where
    lv = interp l env

interp (Concat l1 l2) env = ListV (lst lv1 ++ lst lv2)
  where
    lv1 = interp l1 env
    lv2 = interp l2 env

-- Nuevamente, segun la especificación tenemos que aplicarle strict a ambos argumentos interpretados, pero
-- en este caso nos sirve más no hacerlo así ya que de todas formas es más fácil tomar la función que su cerradura
-- y al hacer la aplicación se le aplicará strict a lo que se le deba aplicar
interp (Map f (ListC l)) env = ListV (map (\x -> interp (App f x) env) l)

-- Mismo caso
interp (Filter f (ListC l)) env = ListV (map (\x -> interp x env) (filter (\x -> bool (interp (App f x) env)) l))

interp (AString s) env = StringV s

interp (ConcatS s1 s2) env = StringV (str i' ++ str d')
  where
    i = interp s1 env
    i' = strict i
    d = interp s2 env
    d' = strict d

interp (At asa1 asa2) env = if null ss then error "Índice fuera de rango" else StringV [head ss]
  where
    i = interp asa1 env
    n = num (strict i)
    d = interp asa2 env
    s = str (strict d)
    ss = drop (floor n) s

interp (LsToStr l) env = undefined

rmj (Just a) = a

strict :: Value -> Value
strict (NumV n) = NumV n
strict (BooleanV b) = BooleanV b
strict (Cerr p c env) = Cerr p c env
strict (VASA asa env) = interp asa env
strict (ListV vals) = ListV (map strict vals)
strict (StringV s) = StringV s
