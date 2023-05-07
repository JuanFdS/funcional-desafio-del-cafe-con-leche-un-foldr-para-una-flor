module Library where
import PdePreludat hiding (($))

-- Desafío, implementar la función aplicación, que recibe una función y un valor y aplica el valor como parámetro a la función.
-- El desafío es que hay que implementarlo sin escribir parámetros, ni usar lambdas ni definir funciones auxiliares.
-- Por ej., estas definiciones NO valen:
-- ($) funcion valor = funcion valor -- porque estan los parametros
-- ($) = \funcion valor -> funcion valor -- porque esta usando una lambda
-- aplicar funcion valor = funcion valor -- porque se esta definiendo una funcion auxiliar 
-- ($) = aplicar
-- Tampoco vale importarlo (ahora se está no importando al hacer hiding (($)))

($) :: (a -> b) -> a -> b
($) = implementame

