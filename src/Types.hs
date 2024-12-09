module Types where

import Lexer
import Parser

-- data Bl = Tr | Fl
--
-- data SASA = SNum Double
--          | SBoolean Bl
--          | SAdd [SASA]
--          | SSub [SASA]
--          | SMult [SASA]
--          | SDiv [SASA]
--          | SAdd1 SASA
--          | SSub1 SASA
--          | SSqrt SASA
--          | SExpt SASA SASA
--          | SLt [SASA]
--          | SGt [SASA]
--          | SEq [SASA]
--          | SNot SASA
--          | SOr [SASA]
--          | SAnd [SASA]
--          | SId String
--          | SLet [(SASA, SASA)] SASA
--          | SLetS [(SASA, SASA)] SASA
--          | SLambda [SASA] SASA
--          | SApp SASA [SASA]
--          | SIf SASA SASA SASA
--          | SCond [(SASA, SASA)] SASA
--          | SLetRec SASA SASA SASA
--          | SListC [SASA]
--          | SHead SASA
--          | STail SASA
--          | SLength SASA
--          | SReverse SASA
--          | SConcat [SASA]
--          | SMap SASA SASA
--          | SFilter SASA SASA
--          | SConcatS [SASA]
--          | SAt SASA SASA
--          | SLsToStr SASA
--          | SString String

idExpr :: SASA -> [(Int, SASA)]
idExpr asa = snd $ idExprI asa 1

idExprI :: SASA -> Int -> (Int, [(Int, SASA)])
idExprI asa@(SNum n) i = (i+1, [(i, asa)])
idExprI asa@(SBoolean b) i = (i+1, [(i, asa)])
idExprI asa@(SString s) i = (i+1, [(i, asa)])
idExprI asa@(SAdd lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SSub lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SMult lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SDiv lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SAdd1 asa1) i = (ni, (i, asa):asaid)
  where
    (ni, asaid) = idlasa (i+1) [asa1]
idExprI asa@(SSub1 asa1) i = (ni, (i, asa):asaid)
  where
    (ni, asaid) = idlasa (i+1) [asa1]
idExprI asa@(SSqrt asa1) i = (ni, (i, asa):asaid)
  where
    (ni, asaid) = idlasa (i+1) [asa1]
idExprI asa@(SExpt asa1 asa2) i = (ni, (i, asa):asaid)
  where
    (ni, asaid) = idlasa (i+1) [asa1, asa2]
idExprI asa@(SLt lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SGt lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SEq lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SNot asa1) i = (ni, (i, asa):asaid)
  where
    (ni, asaid) = idlasa (i+1) [asa1]
idExprI asa@(SOr lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SAnd lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SId s) i = (i+1, [(i, asa)])
idExprI asa@(SLet vals asa3) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) (concatMap (\(asa1, asa2) -> [asa1, asa2]) vals ++ [asa3])
idExprI asa@(SLetS vals asa3) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) (concatMap (\(asa1, asa2) -> [asa1, asa2]) vals ++ [asa3])
idExprI asa@(SLambda lasa asa1) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) (lasa ++ [asa1])
idExprI asa@(SApp asa1 lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) (asa1:lasa)
idExprI asa@(SIf asa1 asa2 asa3) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1, asa2, asa3]
idExprI asa@(SCond conds asa3) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) (concatMap (\(asa1, asa2) -> [asa1, asa2]) conds ++ [asa3])
idExprI asa@(SLetRec asa1 asa2 asa3) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1, asa2, asa3]
idExprI asa@(SListC lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SHead asa1) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1]
idExprI asa@(STail asa1) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1]
idExprI asa@(SLength asa1) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1]
idExprI asa@(SReverse asa1) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1]
idExprI asa@(SConcat lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SMap asa1 asa2) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1, asa2]
idExprI asa@(SFilter asa1 asa2) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1, asa2]
idExprI asa@(SConcatS lasa) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) lasa
idExprI asa@(SAt asa1 asa2) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1, asa2]
idExprI asa@(SLsToStr asa1) i = (ni, (i, asa):lasaid)
  where
    (ni, lasaid) = idlasa (i+1) [asa1]


idlasa :: Int -> [SASA] -> (Int, [(Int, SASA)])
idlasa i [] = (i, [])
idlasa i (asa:lasa) = (ni, asaid ++ lasaid)
  where
    (i', asaid) = idExprI asa i
    (ni, lasaid) = idlasa i' lasa


