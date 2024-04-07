module Context where

import AST
import Type

-- context stuff
type Dict = [(Id, Type)]

data Context =
  Context Dict Dict Dict -- globals, states, locals

stateToDict :: [MState] -> Dict
stateToDict = map (\(MState id t _) -> (id, t))

stateContext :: [MState] -> Context
stateContext ms = Context [] (stateToDict ms) []

emptyContext :: Context
emptyContext = Context [] [] []

-- extends the context with a local variable
extendContext :: Context -> Id -> Type -> Context
extendContext (Context gs ms ls) id t = Context gs ((id, t) : ms) ls

lookupContext :: Context -> Id -> Either [String] Type
lookupContext (Context gs ms ls) id =
  case lookup id gs of
    Just t -> Right t
    Nothing ->
      case lookup id ms of
        Just t -> Right t
        Nothing ->
          case lookup id ls of
            Just t -> Right t
            Nothing -> Left ["Lookup failed: ", show id]

