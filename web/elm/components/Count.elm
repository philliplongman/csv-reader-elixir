module Components.Count exposing (countView)

import Html exposing (..)
import Html.Attributes exposing (class)
import String.Extra exposing (pluralize)

import Model exposing (..)


countView : Model -> Html msg
countView {people} =
  let
    count =
      people
      |> List.length
      |> pluralize "person" "people"

  in
    div [ class "count" ] [ text count ]
