module App exposing (..)

import Html exposing (Html, text, div, img)
import Html.Attributes as H
import Svg as S
import Svg.Attributes as S


type alias Position =
    { x : Int
    , y : Int
    }


type alias Size =
    { width : Int
    , height : Int
    }


type alias Model =
    { size : Size
    }


init : String -> ( Model, Cmd Msg )
init path =
    ( { size = Size 10 10 }, Cmd.none )


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )


intsToString : List Int -> String
intsToString ints =
    ints
        |> List.map toString
        |> List.intersperse " "
        |> List.foldr (++) ""


view : Model -> Html Msg
view { size } =
    let
        viewBoxVal =
            intsToString [ 0, 0, size.width, size.height ]
    in
        div [ H.style [ ( "padding", "20px" ) ] ]
            [ S.svg [ S.width "400", S.height "400", S.viewBox viewBoxVal ]
                (List.range 1 10 |> List.map viewRow)
            ]


viewRow : Int -> S.Svg msg
viewRow rowIdx =
    S.g [] (List.range 1 10 |> List.map (viewCell rowIdx))


viewCell : Int -> Int -> S.Svg msg
viewCell rowIdx colIdx =
    S.rect [ S.x (toString colIdx), S.y (toString rowIdx), S.width "1", S.height "1", S.fill "gray", S.strokeWidth "0.1", S.stroke "white" ] []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
