module Components.PeopleTable.DateColumn exposing (dateColumn)

import Table exposing (Column)
import Date.Extra as Date


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
