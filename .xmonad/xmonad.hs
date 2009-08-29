import XMonad
import XMonad.Config.Gnome
import XMonad.Util.EZConfig
import XMonad.Actions.CycleWS
import XMonad.Prompt
import XMonad.Prompt.AppendFile
import XMonad.Prompt.Shell

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import Graphics.X11.Types


myModMask = mod4Mask


myWorkspaces = ["alpha", "beta", "gamma", "delta", "epsilon", "zeta", "eta", "theta", "iota"]


myManageHook = composeAll . concat $
    [ [className =? c      --> doFloat  | c <- cnFloats]
    , [title     =? t      --> doFloat  | t <- tFloats]
    , [className =? c      --> doIgnore | c <- cnIgnores]

    , [className =? cn      --> action | (cn, action) <- cnHooks]
    , [appName   =? an      --> action | (an, action) <- anHooks]
    ]
    where
        cnFloats    = [ "Pidgin", "Gimp", "Transmission"
                      , "Gnome-system-monitor", "Gnome-calculator", "Gcalctool" ]
        tFloats     = [ "VLC media player" ]
        cnIgnores   = [ "Do" ]

        cnHooks     = [ ("Evolution",           doF (W.shift "gamma"))
                      , ("Pidgin",              doF (W.shift "gamma"))
                      , ("OpenOffice.org 3.0",  doF (W.view "zeta") <+> doF (W.shift "zeta"))
                      , ("Gimp",                doF (W.view "eta") <+> doF (W.shift "eta"))
                      , ("Nautilus",            doF (W.view "epsilon") <+> doF (W.shift "epsilon") <+> doF (W.swapUp))
                      ]

        anHooks     = [ ("Navigator",           doF (W.view "beta") <+> doF (W.shift "beta"))
                      , ("Banshee",             doF (W.view "delta") <+> doF (W.shift "delta"))
                      ]


myKeysP = (
    [ ("M-C-o",     shiftNextScreen)
    , ("M-x",       shellPrompt myXPConfig)
    , ("M-S-n",     appendFilePrompt myXPConfig "/home/michael/NOTES")
    ] )

myKeys = (
    [ ((m .|. myModMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e] [1, 0]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++
    [ ((m .|. myModMask, k), windows $ f i)
        | (i, k) <- zip (myWorkspaces) [xK_1 .. xK_9]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    )


myXPConfig = defaultXPConfig
        { position = Bottom
        , font = "-*-liberation.mono-medium-r-normal-*-13-*-*-*-*-*-*-*"
        }

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False


main = xmonad $ gnomeConfig
        { modMask           = myModMask
        , workspaces        = myWorkspaces
        , focusFollowsMouse = myFocusFollowsMouse
        , manageHook        = manageHook gnomeConfig <+> myManageHook }
        `additionalKeysP` myKeysP
        `additionalKeys` myKeys
