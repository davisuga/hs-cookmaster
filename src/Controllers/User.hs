{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controllers.User where

import Controllers.Common
import Domain.User
import Servant

type UserEndpoints =
  "users" :> GET [User]

-- :<|> "login" :> ReqBody '[JSON] User :> POST User
-- :<|> "users" :> ReqBody '[JSON] User :> POST User

userEndpoints x = getUsers

getUsers :: Handler [User]
getUsers =
  return
    [ User 1 "Isaac" "Newton" "Mathematician",
      User 2 "Albert" "Einstein" "Scientist"
    ]

-- login = return

-- createUser = return
