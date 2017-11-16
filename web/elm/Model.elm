module Model exposing (..)


import Table
import Person exposing (Person)
import Msg exposing (Msg)


type alias Model =
  { filename : Maybe String
  , people : List Person
  , tableState : Table.State
  }


init : (Model, Cmd Msg)
init =
  let
    model =
      { filename = Nothing
      , people = []
      , tableState = Table.initialSort "last"
      }

  in
    ( model, Cmd.none )
