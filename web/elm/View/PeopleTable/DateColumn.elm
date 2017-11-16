module View.PeopleTable.DateColumn exposing (dateColumn)


import Date.Extra as Date
import Table exposing (Column)


dateColumn : String -> (data -> String) -> Column data msg
dateColumn name toDate =
  Table.customColumn
    { name = name
    , viewData = \data -> viewDate (toDate data)
    , sorter = Table.increasingOrDecreasingBy toDate
    }


viewDate : String -> String
viewDate dateStr =
  let
    maybeDate = Date.fromIsoString dateStr

  in
    case maybeDate of
      Just date ->
        Date.toFormattedString "MM/dd/y" date

      Nothing ->
        ""
