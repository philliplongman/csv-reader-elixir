module Msg exposing (..)


import Table
import Ports exposing (FileData)


type Msg
  = FileSelected
  | FileRead FileData
  | SetTableState Table.State
