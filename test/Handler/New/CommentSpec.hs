module Handler.New.CommentSpec where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get NewCommentR
        statusIs 200
