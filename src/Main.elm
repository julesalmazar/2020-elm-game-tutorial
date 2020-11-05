module Main exposing (..)

-- Press buttons to increment and decrement a counter.
--
-- Read how it works:
--     https://guide.elm-lang.org/architecture/buttons.html
--
--
-- If Elm's syntax looks weird to you, read this first:
--     https://guide.elm-lang.org/core_language.html
-- and here's a reference that might be handy:
--     https://elm-lang.org/docs/syntax
--

import Browser
import Html exposing (Html, br, button, div, text)
import Html.Attributes exposing (disabled)
import Html.Events exposing (onClick)
import UndoList exposing (UndoList)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    UndoList Int


init : Model
init =
    UndoList.fresh 0



-- UPDATE


type Msg
    = Increment
    | Decrement
    | Square
    | Undo


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            UndoList.new (model.present + 3) model

        Decrement ->
            UndoList.new (model.present - 1) model

        Square ->
            UndoList.new (model.present ^ 2) model

        Undo ->
            UndoList.undo model



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (String.fromInt model.present) ]
        , button [ onClick Decrement ] [ text "- 1" ]
        , button [ onClick Increment ] [ text "+ 3" ]
        , button [ onClick Square ] [ text "^" ]
        , button
            [ disabled False
            , onClick Undo
            ]
            [ text "Undo" ]
        ]
