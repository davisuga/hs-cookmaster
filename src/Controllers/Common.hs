{-# LANGUAGE DataKinds #-}

module Controllers.Common where

import Servant (Delete, Get, JSON, Patch, Post, Put)

-- | Common type for all controllers
-- | Basically, it's a type alias for servant's types
type GET = Get '[JSON]

type POST = Post '[JSON]

type PUT = Put '[JSON]

type DELETE = Delete '[JSON]

type PATCH = Patch '[JSON]
