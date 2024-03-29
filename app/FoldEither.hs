import Control.Monad

xs :: [Int]
xs = [0, 2, 3, 4]

eval :: Int -> Either String ()
eval x =
  if odd x
    then Left $ show x
    else Right ()

main :: IO ()
main = do
  print $ "hello"

thing :: [Int] -> Either String ()'
thing = foldM (const eval) ()
