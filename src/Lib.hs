{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE TypeOperators #-}

module Lib
  ( startApp,
    app,
  )
where

import Controllers.Common (RootEndpoint)
import Controllers.Recipe
import Controllers.User
import Data.Aeson (defaultOptions)
import Data.Aeson.TH (deriveJSON)
import Domain.Recipe
import Domain.User
import Network.Wai (Application)
import Network.Wai.Handler.Warp (run)
import Servant (Get, JSON, Proxy (..), Server, serve, type (:<|>) ((:<|>)), type (:>))

$(deriveJSON defaultOptions ''Recipe)
$(deriveJSON defaultOptions ''User)

type API = UserEndpoints :<|> RecipeEndpoints

startApp :: IO ()
startApp =
  print "Starting app at http://localhost:8080"
    >> run 8080 app

app :: Application
app = serve api server

api :: Proxy API
api = Proxy

server :: Server API
server = getUsers :<|> getRecipes

users :: [User]
users =
  [ User 1 "Isaac" "Newton" "Mathematician",
    User 2 "Albert" "Einstein" "Scientist"
  ]

recipes :: [Recipe]
recipes =
  [ Recipe "1" "Eggs" "Eggs are the best",
    Recipe "2" "Bacon" "Bacon is the best"
  ]