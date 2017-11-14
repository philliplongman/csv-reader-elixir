module Main exposing (..)

import Html

import Model exposing (..)
import Msg exposing (..)
import Update exposing (..)
import View exposing (..)


main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , update = update
    , subscriptions = always <| Sub.none
    }


init : (Model, Cmd Msg)
init =
  initialModel ! [ Cmd.none ]
