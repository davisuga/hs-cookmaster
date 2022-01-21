{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controllers.User where

import Controllers.Common
import Models.User
import Servant

type UserEndpoints =
  "users" :> GET [User]
    :<|> "login" :> ReqBody '[JSON] User :> POST User
    :<|> "users" :> ReqBody '[JSON] User :> POST User