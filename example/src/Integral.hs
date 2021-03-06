module Integral where

import Control.Applicative
import FRP.Reactive
import FRP.Reactive.LegacyAdapters

velocity1 :: Behavior Double
velocity1 = 1

position :: Behavior Double
position = integral (atTimes [0 ..]) velocity1

main :: IO ()
main = adaptE $ print <$> position `snapshot_` atTimes [0,2 ..]
