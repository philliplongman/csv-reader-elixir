module Update exposing (update)


import Http
import Decoders exposing (decodePeople)
import Encoders exposing (encodeFile)
import Model exposing (Model)
import Msg exposing (..)
import Ports exposing (FileData, fileSelected, fileRead)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    FileSelected ->
      ( model
      , fileSelected ()
      )

    FileRead file ->
      ( { model | filename = Just file.name }
      , uploadFile file
      )

    FileParsed (Ok people) ->
      ( { model | people = people }
      , Cmd.none
      )

    FileParsed (Err _) ->
      ( { model | people = [] }
      , Cmd.none
      )

    SetTableState newState ->
      ( { model | tableState = newState }
      , Cmd.none
      )


uploadFile : FileData -> Cmd Msg
uploadFile file =
  let
    body =
      Http.jsonBody (encodeFile file)

    decoder =
      decodePeople

    request =
      Http.post "/api/upload" body decoder

  in
    Http.send FileParsed request
