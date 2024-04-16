module Main where

import System.Environment
import System.IO

import Parser
import Lexer
import Typechecker
import Eval
import CodeGen
import Unique
import Instructions
import Prettyprinter

main :: IO ()
main = do
  args <- getArgs
  let file = args !! 0
  handle <- openFile file ReadMode
  contents <- hGetContents handle

--  line <- getContents
  let toks = lexer contents

--  putStr "Tokens: "
--  print toks

  let ast = parse toks

--  putStr "AST: "
--  print ast

  case typeCheck ast of
    Just e  -> putStrLn $ "Type error: " ++ e
    Nothing -> do
--                 putStrLn "Type checker OK"
--                 print $ evalN 100 ast
                 mapM_ (print . pretty) (codeGen ast)

  return ()
