module Spec where

import PdePreludat hiding (($))
import Library
import Test.Hspec
import Control.Exception (evaluate)

correrTests = hspec P.$ do
  it "$ aplica un parametro a una funcion" P.$ do
    length $ "hola" `shouldBe` 4
    (3 *) $ 9 `shouldBe` 27
  
