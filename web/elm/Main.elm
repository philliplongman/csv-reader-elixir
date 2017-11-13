module Main exposing (..)

import Html exposing (..)


main : Program Never Model Msg
main =
  Html.program
    { init = init
    , view = view
    , subscriptions = subscriptions
    , update = update
    }


-- MODEL


type alias Model = {}


init : (Model, Cmd Msg)
init =
  ({}, Cmd.none)


-- UPDATE


type Msg = Upload String


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Upload file ->
      (model, Cmd.none)


-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- VIEW


view : Model -> Html Msg
view model =
  div []
    [ text "Hello world!"
    ]
