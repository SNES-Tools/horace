import Control.Monad

xs :: [Int]
xs = [0, 2, 3, 4]

--foo :: (Monad m) => b -> Int -> m b
foo r@(Right _) _ = r
foo (Left _) x = eval x

eval :: Int -> Either () String
eval x =
  if odd x
    then Left ()
    else Right $ show x
