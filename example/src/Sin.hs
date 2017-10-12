import FRP.Reactive
import FRP.Reactive.LegacyAdapters
import Control.Applicative

sinB :: Behavior Double
sinB = sin <$> time

draw :: Behavior Double -> Scale -> Behavior String
draw d s = replicate <$> (truncate <$> scaled) <*> pure '#'
  where scaled = pure s * (d + 1)

type Scale = Double

sinWave :: Scale -> Behavior String
sinWave = draw sinB

main :: IO ()
main = adaptE $ putStrLn <$> sinWave 30 `snapshot_` atTimes [0, 0.2 ..]