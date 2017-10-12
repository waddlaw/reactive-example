import FRP.Reactive
import FRP.Reactive.LegacyAdapters

main :: IO ()
main = adaptE $ print <$> time `snapshot_` atTimes [0..]