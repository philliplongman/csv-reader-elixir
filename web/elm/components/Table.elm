module Components.Table exposing (tableView)

import Html exposing (..)
import Html.Attributes exposing (class)

import Model exposing (..)
import Msg exposing (..)


tableView : Model -> Html msg
tableView model =
  table [] []
