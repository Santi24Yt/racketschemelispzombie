module Repl where

import System.Console.Haskeline
import Control.Exception
import Control.Monad.Trans.Class

import Lexer
import Parser
import Desugar
import Interp

opts = Settings {
  complete = completeFilename,
  historyFile = Just "./minilisp_history",
  autoAddHistory = True
}

main :: IO ()
main = do
  putStrLn "Bienvenido a MiniLisp v6.0\n(:q -> salir), (:l archivo -> ejecutar archivo), (expr -> ejecutar expresión)"
  runInputT opts repl
  putStrLn "Saliendo"

repl :: InputT IO ()
repl = do
  input <- getInputLine "> "
  case input of
    Nothing -> return ()
    Just ":q" -> return ()
    Just (':':'l':' ':f) -> do
      contenido <- leerArchivo f
      -- lift $ putStrLn $ show $ trim f
      -- lift $ putStrLn $ show $ unwords (lines contenido)
      let contenidoClean = unwords (lines contenido)
      if contenidoClean == "" then do
        lift $ putStrLn "Archivo no encontrado o vacío"
        repl
      else do
        lift $ putStrLn ("> "++contenidoClean)
        run contenidoClean >> repl
    Just "" -> repl
    Just s -> run s >> repl

run s = lift (catch (print (interp (desugar $ parser $ lexer s) [])) (\(e :: ErrorCall) -> putStrLn $ displayException e))

leerArchivo a = lift (catch (readFile (trim a)) (\(e :: IOException) -> return ""))

trim str = reverse (dropWhile (\x -> x == ' ') (reverse (dropWhile (\x -> x == ' ') str)))
