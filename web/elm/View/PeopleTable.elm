module View.PeopleTable exposing (tableView)


import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Table exposing (HtmlDetails, Status(..), defaultCustomizations)
import Model exposing (..)
import Model.Person exposing (Person)
import Msg exposing (..)
import View.PeopleTable.DateColumn exposing (dateColumn)
import View.PeopleTable.PetColumn exposing (petColumn)


tableView : Model -> Html Msg
tableView { people, tableState } =
  let
    message =
      if List.isEmpty people then
        div [ class "empty" ] [ text "No records" ]

      else
        div [] []

  in
    div []
      [ Table.view config tableState people
      , message
      ]


config : Table.Config Person Msg
config =
  Table.customConfig
    { toId = .last
    , toMsg = SetTableState
    , columns =
      [ Table.stringColumn "Last" .last
      , Table.stringColumn "First" .first
      , Table.stringColumn "Middle" .middle
      , petColumn "Pet" .pet
      , dateColumn "Birthday" .birthday
      , Table.stringColumn "Color" .color
      ]
    , customizations =
      { defaultCustomizations | thead = customHeaders }
    }


customHeaders : List ( String, Status, Attribute msg ) -> HtmlDetails msg
customHeaders headers =
  headers
    |> List.map customHeadersHelper
    |> HtmlDetails []


customHeadersHelper : ( String, Status, Attribute msg ) -> Html msg
customHeadersHelper ( name, status, onClick ) =
  let
    sortClass =
      case status of
        Reversible (Just isReversed) ->
          if isReversed then
            "ascending"
          else
            "descending"

        _ ->
          ""
  in
    th [ onClick ] [ text name, span [ class sortClass ] [] ]
