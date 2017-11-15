module Model exposing (..)

import Table

import Msg exposing (..)


type alias Model =
  { filename : String
  , people : List Person
  , tableState : Table.State
  }


type alias Person =
  { index : Int
  , last : String
  , first : String
  , middle : String
  , pet : String
  , birthday : String
  , color : String
  }


init : (Model, Cmd Msg)
init =
  let
    model =
      { filename = ""
      , people =
        [ Person 1 "No records" "" "" "" "" "" ]
      , tableState = Table.initialSort "last"
      }

  in
    ( model, Cmd.none )
