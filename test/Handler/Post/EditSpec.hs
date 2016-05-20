module Handler.Post.EditSpec (spec) where

import TestImport

spec :: Spec
spec =
  withApp $ do
    describe "valid request" $ do
      it "gives a 200" $ do
        get (PostEditR "foo")
        statusIs 200
