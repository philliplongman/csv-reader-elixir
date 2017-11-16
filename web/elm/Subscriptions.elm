module Subscriptions exposing (..)


import Model exposing (Model)
import Msg exposing (Msg(FileRead))
import Ports exposing (fileRead)


subscriptions : Model -> Sub Msg
subscriptions model =
  fileRead FileRead
