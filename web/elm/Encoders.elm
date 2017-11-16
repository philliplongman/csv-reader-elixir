module Encoders exposing (encodeFile)


import Json.Encode as Json exposing (object, string)
import Ports exposing (FileData)


encodeFile : FileData -> Json.Value
encodeFile file =
  object
    [ ( "name", string file.name )
    , ( "contents", string file.contents )
    ]
