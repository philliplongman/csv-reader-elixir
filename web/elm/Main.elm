module Main exposing (..)


import Html
import Model exposing (..)
import Msg exposing (..)
import Update exposing (..)
import View exposing (..)
import Subscriptions exposing (..)


main : Program Never Model Msg
main =
  Html.program
    { init = init
    , update = update
    , view = view
    , subscriptions = subscriptions
    }
