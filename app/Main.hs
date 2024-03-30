module Main where

import System.IO

import Parser
import Lexer
import Type
import Eval
import Instructions
import Prettyprinter

main :: IO ()
main = do
  let prog = [TAX, ADC (Imm8 30)]
  putDocCompact $ pretty prog
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
