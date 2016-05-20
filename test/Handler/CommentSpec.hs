module Handler.CommentSpec where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get (CommentR (toSqlKey 1))
        statusIs 200
