port module Ports exposing (..)


type alias FileData =
    { name : String
    , contents : String
    }


port fileSelected : () -> Cmd msg


port fileRead : (FileData -> msg) -> Sub msg
