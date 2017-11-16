module Model.Person exposing (Person)


type alias Person =
  { index : Int
  , last : String
  , first : String
  , middle : String
  , pet : String
  , birthday : String
  , color : String
  }
