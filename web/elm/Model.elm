module Model exposing (..)


type alias Model =
  { filename : String
  , people : List Person
  }


type alias Person =
  { last : String
  , first : String
  , middle : String
  , pet : String
  , birthday : String
  , color : String
  }


initialModel : Model
initialModel =
  { filename = ""
  , people = []
  }
