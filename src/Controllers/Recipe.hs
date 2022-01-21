{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Controllers.Recipe where

import Controllers.Common
import Models.Recipe (Recipe)
import Servant

type RecipeEndpoints =
  "recipes" :> GET [Recipe]
    :<|> "recipes" :> ReqBody '[JSON] Recipe :> POST Recipe
    :<|> "recipes" :> Capture "id" Int :> GET Recipe
    :<|> "recipes" :> Capture "id" Int :> ReqBody '[JSON] Recipe :> PUT Recipe
    :<|> "recipes" :> Capture "id" Int :> DELETE NoContent