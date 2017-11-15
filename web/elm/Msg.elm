module Msg exposing (..)

import Table


type Msg
  = UploadFile String
  | SetTableState Table.State
