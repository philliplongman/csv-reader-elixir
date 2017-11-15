module Components.FileUploader exposing (uploaderView)

import Html exposing (..)
import Html.Attributes exposing (class, enctype, for, id, name, type_)
import Html.Events exposing (onInput)

import Model exposing (..)
import Msg exposing (..)


uploaderView : Model -> Html Msg
uploaderView model =
  form [ enctype "multipart/form-data" ]
    [ label [ for "file" ] [ text "Import a file" ]
    , div [ class "inputs" ]
      [ label [ class "filename", for "file" ] [ text model.filename ]
      , label [ class "button", for "file" ] [ text "Browse" ]
      , input
        [ id "file"
        , class "hidden"
        , name "file"
        , type_ "file"
        , onInput UploadFile
        ]
        []
      ]
    ]
