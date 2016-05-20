module Handler.Comment.DelSpec where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get (CommentDelR (toSqlKey 1))
        statusIs 200
