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
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = Increment
    | Decrement
    | Square


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model + 3

        Decrement ->
            model - 1

        Square ->
            model ^ model



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text (String.fromInt model) ]
        , button [ onClick Decrement ] [ text "-" ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick Square ] [ text "^" ]
        ]
