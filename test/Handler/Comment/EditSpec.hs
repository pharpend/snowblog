module Handler.Comment.EditSpec (spec) where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get (CommentEditR (toSqlKey 1))
        statusIs 200
