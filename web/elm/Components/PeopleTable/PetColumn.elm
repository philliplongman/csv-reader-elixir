module Components.PeopleTable.PetColumn exposing (petColumn)

import Html exposing (text)
import Html.Attributes exposing (class)

import Table exposing (Column)


petColumn : String -> (data -> String) -> Column data msg
petColumn name toStr =
  Table.veryCustomColumn
    { name = name
    , viewData = \data -> viewPet (toStr data)
    , sorter = Table.increasingOrDecreasingBy toStr
    }


viewPet : String -> Table.HtmlDetails msg
viewPet petStr =
  let
    petClass = String.toLower ("pet-" ++ petStr)

  in
    Table.HtmlDetails [ class petClass ] [ text petStr ]
