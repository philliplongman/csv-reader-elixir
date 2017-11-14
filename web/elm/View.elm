module View exposing (view)

import Html exposing (..)

import Model exposing (..)
import Msg exposing (..)

import Components.Count exposing (countView)
import Components.Table exposing (tableView)
import Components.Uploader exposing (uploaderView)


view : Model -> Html Msg
view model =
  div []
    [ countView model
    , uploaderView model
    , tableView model
    ]
