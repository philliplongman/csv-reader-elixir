module View exposing (view)

import Html exposing (..)

import Model exposing (..)
import Msg exposing (..)

import Components.Count exposing (countView)
import Components.PeopleTable exposing (tableView)
import Components.FileUploader exposing (uploaderView)


view : Model -> Html Msg
view model =
  div []
    [ countView model
    , uploaderView model
    , tableView model
    ]
