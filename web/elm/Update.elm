module Update exposing (update)

import Model exposing (Model)
import Msg exposing (..)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    UploadFile file ->
      ( model, Cmd.none )

    SetTableState newState ->
      ( { model | tableState = newState }
      , Cmd.none
      )
