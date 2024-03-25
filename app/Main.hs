module Main where

import Parser
import Lexer

main :: IO ()
main = getLine >>= print . parse . lexer
