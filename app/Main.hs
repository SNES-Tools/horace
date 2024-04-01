module Main where

import System.IO

import Parser
import Lexer
import Type
import Eval
import CodeGen
import Instructions
import Prettyprinter

main :: IO ()
main = do
--  let prog = [TAX, ADC (Imm8 30)]
--  putDocCompact $ pretty prog
  src <- getContents
  testCode src
--  line <- getContents
--  let toks = lexer line

--  putStr "Tokens: "
--  print toks

--  let ast = parse toks

--  putStr "AST: "
--  print ast

--  case typeof ast of
--    Left t -> do
--                putStr "Type: "
--                print t
--    Right e -> print e

--  putStr "Eval: "
--  (print . eval) ast

testCode :: String -> IO ()
testCode str = do
  let ast = (parse . lexer) str
  code <- codeGen ast
  (putDocCompact . pretty) code
  print $ codeBlockSize code

{-
repl :: IO ()
repl = do
  putStr "> "
  hFlush stdout

  line <- getLine
  let toks = lexer line

  putStr "Tokens: "
  print toks

  let ast = parse toks

  putStr "AST: "
  print ast

  putStr "Type: "
  typeof ast

  repl
-}
