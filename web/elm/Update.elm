module Update exposing (update)


import Model exposing (Model)
import Msg exposing (..)
import Ports exposing (fileSelected, fileRead)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    FileSelected ->
      ( model
      , fileSelected ()
      )

    FileRead file ->
      ( { model | filename = Just file.name }
      , Cmd.none
      )

    SetTableState newState ->
      ( { model | tableState = newState }
      , Cmd.none
      )
