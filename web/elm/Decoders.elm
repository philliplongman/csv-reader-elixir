module Decoders exposing (decodePeople)


import Json.Decode exposing (Decoder, field, list, string)
import Json.Decode.Pipeline exposing (decode, required, optional)
import Model.Person exposing (Person)


decodePeople : Decoder (List Person)
decodePeople =
  field "people" (list personDecoder)


personDecoder : Decoder Person
personDecoder =
  decode Person
    |> required "last" string
    |> required "first" string
    |> optional "middle" string ""
    |> required "pet" string
    |> required "birthday" string
    |> required "color" string
