module View exposing (view)


import Html exposing (Html, main_)
import Html.Attributes exposing (attribute)
import Model exposing (..)
import Msg exposing (..)
import View.Count exposing (countView)
import View.PeopleTable exposing (tableView)
import View.FileUploader exposing (uploaderView)


view : Model -> Html Msg
view model =
  main_ [ attribute "role" "main" ]
    [ countView model
    , uploaderView model
    , tableView model
    ]
