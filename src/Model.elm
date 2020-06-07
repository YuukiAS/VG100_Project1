module Model exposing (..)
import Message exposing (Msg)


type alias Point =
    {
        x : Float
    ,   y: Float
    }

type alias Keys =
    {
        left: Bool
    ,   right: Bool
    ,   enter: Bool
    }


nokeys: Keys
nokeys =
    Keys False False False

type alias Model =
    { keys : Keys
    , pad_x : Float
    , pad_vx : Float  -- 加速度
    , ball_x : Float
    , ball_y : Float
    , ball_vx : Float
    , ball_vy : Float
    , blueBricks: List (Int, Int)
    , cyanBricks: List (Int, Int)
    , emptyBricks: List (Int, Int)
    }

initial : () -> (Model, Cmd Msg)
initial _ =
    ({
        keys = nokeys
      , pad_x = 44
      , pad_vx = 0  -- 加速度
      , ball_x = 50
      , ball_y = 37.5
      , ball_vx = 0
      , ball_vy = 0
      , blueBricks =
        [ (0, 0), (0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (0, 6), (0, 7), (0, 8), (0, 9), (0, 10), (0, 11)
            , (1, 0), (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11)
            , (2, 0), (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10), (2, 11)
            , (3, 0), (3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10), (3, 11)
            , (4, 0), (4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9), (4, 10), (4, 11)
            ]

      , cyanBricks = []
      , emptyBricks = [] --debug
    }, Cmd.none)

type State     -- 正在进行或停止,milestone3用
    = Paused
    | Playing
    | Stopped