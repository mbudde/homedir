import XMonad
import XMonad.Config.Gnome


myManageHook = composeAll
    [ className =? "Pidgin"    --> doFloat
    , className =? "Pidgin"    --> doShift "im"
    , className =? "Rhythmbox" --> doShift "music"
    , className =? "Evolution" --> doShift "im"
    , className =? "Do"        --> doIgnore ]


myWorkspaces = [ "code", "web", "im", "music" ] ++ map show [5..9]

main =
    xmonad gnomeConfig
    { manageHook = manageHook gnomeConfig <+> myManageHook
    , modMask    = mod4Mask
    , workspaces = myWorkspaces }
