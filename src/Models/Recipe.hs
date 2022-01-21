module Models.Recipe where

data Recipe = Recipe
  { name :: Int,
    ingredients :: String,
    preparation :: String
  }
  deriving (Eq, Show)
