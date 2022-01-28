module Domain.Recipe where

data Recipe = Recipe
  { name :: String,
    ingredients :: String,
    preparation :: String
  }
  deriving (Eq, Show)
