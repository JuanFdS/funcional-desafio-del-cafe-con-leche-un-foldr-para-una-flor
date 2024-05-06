module Spec where

import PdePreludat hiding (foldr, sum, elem, all, any, Number(..))
import Prelude (foldr, sum, elem, all, any)
import Library
import Test.Hspec
import Control.Exception (evaluate)

correrTests = hspec $ do
  describe "foldr" $ do
    it "cuando el arbol tiene solo la raiz opera la semilla con la raiz" $ do
      foldr (+) 2 (RoseTree 5 []) `shouldBe` 7
    it "cuando el arbol tiene hijos los foldea segun la funcion dada" $ do
      foldr (*) 2 (RoseTree 5 [RoseTree 5 [], RoseTree 3 []]) `shouldBe` 150
    it "cuando el arbol tiene subarboles los foldea segun la funcion dada" $ do
      foldr (++) "." (RoseTree "hola" [RoseTree "," [RoseTree " " []],
                                       RoseTree "como" [RoseTree " " [],
                                                        RoseTree "va" [RoseTree "?" [RoseTree " " []]]
                                                       ],
                                       RoseTree "yo" [RoseTree " " []],
                                       RoseTree "todo" [RoseTree " " [],
                                                        RoseTree "bien" []
                                                       ]
                                      ]) `shouldBe` "hola, como va? yo todo bien."
    it "las funciones basadas en el foldr tambien funcionan correctamente" $ do
      sum (RoseTree 5 [RoseTree 5 [], RoseTree 3 []]) `shouldBe` 13
      elem "todo" (RoseTree "hola" [RoseTree "," [RoseTree " " []],
                               RoseTree "como" [RoseTree " " [],
                                                RoseTree "va" [RoseTree "?" [RoseTree " " []]]
                                                ],
                               RoseTree "yo" [RoseTree " " []],
                               RoseTree "todo" [RoseTree " " [],
                                                RoseTree "bien" []
                                               ]
                                      ]) `shouldBe` True
      all ((> 2).length) (RoseTree "hola" [RoseTree "," [RoseTree " " []],
                               RoseTree "como" [RoseTree " " [],
                                                RoseTree "va" [RoseTree "?" [RoseTree " " []]]
                                                ],
                               RoseTree "yo" [RoseTree " " []],
                               RoseTree "todo" [RoseTree " " [],
                                                RoseTree "bien" []
                                               ]
                                      ]) `shouldBe` False
