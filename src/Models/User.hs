module Models.User where

data User = User
  { name :: Int,
    email :: String,
    password :: String,
    role :: String
  }
  deriving (Eq, Show)
