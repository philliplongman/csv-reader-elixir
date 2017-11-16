module View.FileUploader exposing (uploaderView)


import Html exposing (..)
import Html.Attributes exposing (class, enctype, for, id, name, type_)
import Html.Events exposing (on)
import Json.Decode as Json
import Model exposing (..)
import Msg exposing (..)


uploaderView : Model -> Html Msg
uploaderView {filename} =
  let
    displayName =
      case filename of
        Just name -> name
        Nothing   -> ""

  in
    form [ class "file-uploader", enctype "multipart/form-data" ]
      [ label [ for "file" ] [ text "Import a file" ]
      , div [ class "inputs" ]
        [ label [ class "filename", for "file" ] [ text displayName ]
        , label [ class "button", for "file" ] [ text "Browse" ]
        , input
          [ id "file"
          , class "hidden"
          , name "file"
          , type_ "file"
          , on "change" (Json.succeed FileSelected)
          ]
          []
        ]
      ]
