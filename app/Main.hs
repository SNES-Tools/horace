module Main where

import System.IO

import Parser
import Lexer
import Type

main :: IO ()
main = do
  repl

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
  print $ typeof ast

  repl
