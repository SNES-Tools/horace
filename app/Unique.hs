import Data.Unique

main = do
  x <- gensym
  print x

gensym :: IO String
gensym = do
  x <- newUnique
  return $ "label" ++ (show $ hashUnique x)

genstr :: String -> IO String
genstr s = do
  x <- newUnique
  return $ s ++ (show $ hashUnique x)
