module Desugar where

import Parser

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

showlasa :: [ASA] -> String
showlasa [] = ""
showlasa lasa = concat (intercala (map show lasa) " ")

instance Show ASA where
  show (Num n) = show n
  show (Boolean Tr) = "#t"
  show (Boolean Fl) = "#f"
  show (Add asa1 asa2) = "(+ " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (Sub asa1 asa2) = "(- " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (Mult asa1 asa2) = "(* " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (Div asa1 asa2) = "(/ " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (Add1 asa) = "(add1 " ++ show asa ++ ")"
  show (Sub1 asa) = "(sub1 " ++ show asa ++ ")"
  show (Sqrt asa) = "(sqrt " ++ show asa ++ ")"
  show (Expt asa1 asa2) = "(expt " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (Lt asa1 asa2) = "(< " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (Gt asa1 asa2) = "(> " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (Eq asa1 asa2) = "(= " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (Not asa) = "(not " ++ show asa ++ ")"
  show (Or asa1 asa2) = "(or " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (And asa1 asa2) = "(and " ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (Id var) = var
  show (Lambda asa1 asa2) = "(lambda (" ++ show asa1 ++ ") " ++ show asa2 ++ ")"
  show (App asa1 asa2) = "(" ++ show asa1 ++ " " ++ show asa2 ++ ")"
  show (If asa1 asa2 asa3) = "(if " ++ show asa1 ++ " " ++ show asa2 ++ " " ++ show asa3 ++ ")"
  show (ListC lasa) = "(list "++showlasa lasa++")"
  show (Head asa) = "(head "++show asa++")"
  show (Tail asa) = "(tail "++show asa++")"
  show (Length asa) = "(length "++show asa++")"
  show (Reverse asa) = "(reverse "++show asa++")"
  show (Concat asa1 asa2) = "(concat "++show asa1++" "++show asa2++")"
  show (Map asa1 asa2) = "(map "++show asa1++" "++show asa2++")"
  show (Filter asa1 asa2) = "(filter "++show asa1++" "++show asa2++")"
  show (ConcatS asa1 asa2) = "(sconcat "++show asa1++" "++show asa2++")"
  show (At asa1 asa2) = "(at "++show asa1++" "++show asa2++")"
  show (LsToStr asa) = "(lstostr "++show asa++")"
  show (AString s) = "\""++s++"\""


-- Fue la manera más eficiente que se me ocurrió para preservar el orden de operaciones
-- desugar (S llasa) = desugarl (S (reverse llasa))
--   where
--     desugarl (S [asa]) = desugar asa
--     desugarl (S (asa:lasa)) = A (desugarl (S lasa)) (desugar asa) 

desugar :: SASA -> ASA
desugar (SNum n) = Num n
desugar (SBoolean b) = Boolean b
desugar (SAdd llasa) = desugarl (SAdd (reverse llasa))
  where
    desugarl (SAdd [asa]) = desugar asa
    desugarl (SAdd (asa:lasa)) = Add (desugarl (SAdd lasa)) (desugar asa)
desugar (SSub llasa) = desugarl (SSub (reverse llasa))
  where
    desugarl (SSub [asa]) = desugar asa
    desugarl (SSub (asa:lasa)) = Sub (desugarl (SSub lasa)) (desugar asa)
desugar (SMult llasa) = desugarl (SMult (reverse llasa))
  where
    desugarl (SMult [asa]) = desugar asa
    desugarl (SMult (asa:lasa)) = Mult (desugarl (SMult lasa)) (desugar asa)
desugar (SDiv llasa) = desugarl (SDiv (reverse llasa))
  where
    desugarl (SDiv [asa]) = desugar asa
    desugarl (SDiv (asa:lasa)) = Div (desugarl (SDiv lasa)) (desugar asa)
desugar (SAdd1 asa) = Add1 (desugar asa)
desugar (SSub1 asa) = Sub1 (desugar asa)
desugar (SSqrt asa) = Sqrt (desugar asa)
desugar (SExpt asa1 asa2) = Expt (desugar asa1) (desugar asa2)
desugar (SLt [asa]) = Boolean Tr
desugar (SLt llasa) = andify $ desugarl (SLt llasa)
  where
    desugarl :: SASA -> [ASA]
    desugarl (SLt [asa]) = []
    desugarl (SLt (asa1:asa2:lasa)) = Lt (desugar asa1) (desugar asa2) : desugarl (SLt (asa2:lasa))
desugar (SGt [asa]) = Boolean Tr
desugar (SGt llasa) = andify $ desugarl (SGt llasa)
  where
    desugarl :: SASA -> [ASA]
    desugarl (SGt [asa]) = []
    desugarl (SGt (asa1:asa2:lasa)) = Gt (desugar asa1) (desugar asa2) : desugarl (SGt (asa2:lasa))
desugar (SEq [asa]) = Boolean Tr
desugar (SEq llasa) = andify $ desugarl (SEq llasa)
  where
    desugarl :: SASA -> [ASA]
    desugarl (SEq [asa]) = []
    desugarl (SEq (asa1:asa2:lasa)) = Eq (desugar asa1) (desugar asa2) : desugarl (SEq (asa2:lasa))
desugar (SNot asa) = Not (desugar asa)
desugar (SOr llasa) = desugarl (SOr (reverse llasa))
  where
    desugarl (SOr [asa]) = desugar asa
    desugarl (SOr (asa:lasa)) = Or (desugarl (SOr lasa)) (desugar asa)
desugar (SAnd llasa) = desugarl (SAnd (reverse llasa))
  where
    desugarl (SAnd [asa]) = desugar asa
    desugarl (SAnd (asa:lasa)) = And (desugarl (SAnd lasa)) (desugar asa)
desugar (SLet vars asa) = desugar (SApp (SLambda ids asa) vals)
  where
    ids = map fst vars
    vals = map snd vars
desugar (SLetS [] asa) = desugar asa
desugar (SLetS (var:vars) asa) = App (Lambda (desugar id) (desugar (SLetS vars asa))) (desugar val)
  where
    id = fst var
    val = snd var
desugar (SId var) = Id var
desugar (SLambda [asa1] asa2) = Lambda (desugar asa1) (desugar asa2)
desugar (SLambda (asa1:lasa) asa2) = Lambda (desugar asa1) (desugar (SLambda lasa asa2))
desugar (SApp asa1 llasa) = desugarl (SApp asa1 (reverse llasa))
  where
    desugarl (SApp asa1 [asa2]) = App (desugar asa1) (desugar asa2)
    desugarl (SApp asa1 (asa2:lasa)) = App (desugarl (SApp asa1 lasa)) (desugar asa2)
desugar (SIf asa1 asa2 asa3) = If (desugar asa1) (desugar asa2) (desugar asa3)
-- Este caso no debería pasar pero igual lo puse
desugar (SCond [] asa2) = If (Boolean Fl) (Add (Num 1) (Num 1)) (desugar asa2)
desugar (SCond [(cond, thn)] els) = If (desugar cond) (desugar thn) (desugar els)
desugar (SCond ((cond, thn):lasa) els) = If (desugar cond) (desugar thn) (desugar (SCond lasa els))

desugar (SListC lasa) = ListC (map desugar lasa)
desugar (SHead asa) = Head (desugar asa)
desugar (STail asa) = Tail (desugar asa)
desugar (SLength asa) = Length (desugar asa)
desugar (SReverse asa) = Reverse (desugar asa)
desugar (SConcat llasa) = desugarl (SConcat (reverse llasa))
  where
    desugarl (SConcat [asa]) = desugar asa
    desugarl (SConcat (asa:lasa)) = Concat (desugarl (SConcat lasa)) (desugar asa)
desugar (SMap asa1 asa2) = Map (desugar asa1) (desugar asa2)
desugar (SFilter asa1 asa2) = Filter (desugar asa1) (desugar asa2)
desugar (SConcatS llasa) = desugarl (SConcatS (reverse llasa))
  where
    desugarl (SConcatS [asa]) = desugar asa
    desugarl (SConcatS (asa:lasa)) = ConcatS (desugarl (SConcatS lasa)) (desugar asa)
desugar (SAt asa1 asa2) = At (desugar asa1) (desugar asa2)
desugar (SLsToStr asa) = LsToStr (desugar asa)
desugar (SString s) = AString s
desugar (SLetRec id val asa) = desugar (SLetS [(id, SApp (SId "Y") [SLambda [id] val])] asa)

andify :: [ASA] -> ASA
andify [asa] = asa
andify (asa1:asa2:lasa) = And asa1 (andify (asa2:lasa))
