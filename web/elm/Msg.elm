module Msg exposing (..)


import Http
import Table
import Model.Person exposing (Person)
import Ports exposing (FileData)


type Msg
  = FileSelected
  | FileRead FileData
  | FileParsed (Result Http.Error (List Person))
  | SetTableState Table.State
