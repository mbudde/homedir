import XMonad
import XMonad.Actions.CycleWS
import XMonad.Config.Gnome
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.ManageDocks
import XMonad.Layout.Grid
import XMonad.Layout.IM
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ResizableTile
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.TwoPane
import XMonad.Prompt
import XMonad.Prompt.AppendFile
import XMonad.Util.EZConfig
import XMonad.Util.Run (spawnPipe)

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

import Data.Ratio ((%))
import Graphics.X11.Types
import System.Exit
import System.IO

myModMask  = mod4Mask
selected   = "'#fad184'"
background = "'#efebe7'"
foreground = "'#000000'"
barHeight  = "24"


myWorkspaces = ["1:web", "2:code", "3:code", "4:music", "5:nav", "6:im", "7:doc", "8", "9", "0:torrent"]

myManageHook = composeAll
    [ float (c "Gimp")
    , float (c "Gnome-system-monitor")
    , float (c "Gnome-calculator")
    , float (c "Gcalctool")
    , float (a "Download")                 -- Firefox download window
    , float (t "VLC media player")
    , ignore (c "Do")
    , moveTo (c "Pidgin") "6:im"
    , moveTo (c "Transmission") "0:torrent"
    , moveToAndShow (a "Navigator")             "1:web"
    , moveToAndShow (a "Banshee")               "4:music"
    , moveToAndShow (c "Nautilus")              "5:nav"
    , moveToAndShow (c "OpenOffice.org 3.0")    "7:doc"
    , moveToAndShow (c "Gimp")                  "9"
    ]
    where
        float         t    =  t --> doFloat
        ignore        t    =  t --> doIgnore
        moveTo        t w  =  t --> (doF (W.shift w))
        moveToAndShow t w  =  t --> (doF (W.view w) <+> doF (W.shift w))
        c n  =  className =? n
        a n  =  appName   =? n
        t n  =  title     =? n


myKeysP = (
    [ ("M-C-o",     shiftNextScreen)
    , ("M-S-n",     appendFilePrompt myXPConfig "/home/michael/NOTES")
    , ("M-p",       spawn myDmenuBar)
    ] )

myKeys = (
    [ ((m .|. myModMask, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e] [1, 0]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)] ]
    ++
    [ ((m .|. myModMask, k), windows $ f i)
        | (i, k) <- zip (myWorkspaces) ([xK_1 .. xK_9] ++ [xK_0])
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)] ]
    )


myXPConfig = defaultXPConfig
    { position = Bottom
    , font = "-*-liberation.mono-medium-r-normal-*-13-*-*-*-*-*-*-*"
    }


myFocusFollowsMouse = False


myAppFont =
    "'xft\
        \:Sans\
        \:pixelsize=12\
    \'"

myDmenuBar =
    "exec `dmenu_path | dmenu\
        \ -p 'Run:'\
        \ -i\
        \ -bh " ++ barHeight  ++ "\
        \ -nb " ++ background ++ "\
        \ -nf " ++ foreground ++ "\
        \ -sb " ++ selected   ++ "\
        \ -fn " ++ myAppFont  ++ "\
    \`"


myLogHook xmobar = dynamicLogWithPP $ defaultPP
        { ppOutput          = hPutStrLn     xmobar
        , ppTitle           = xmobarColor "white"    "" . shorten 200
        , ppCurrent         = xmobarColor "white"    "" . wrap "[" "]"
        , ppVisible         = wrap "<" ">"
        , ppUrgent          = xmobarColor "yellow"   ""
        , ppHidden          = xmobarColor "#aaa"     "" . pad
        , ppHiddenNoWindows = xmobarColor "#555"     "" . pad
        , ppSep             = xmobarColor "#555"     "" " / "
        , ppWsSep           = " "
        }


myLayoutHook =
    ( avoidStruts $ smartBorders $
      onWorkspace "6:im" im
      (tiled ||| (Mirror tiled) ||| twopane ||| Full)
    ) ||| (noBorders Full)
    where
        im      = withIM (1%6) (ClassName "Pidgin") Grid
        tiled   = Tall nmaster delta ratio
        twopane = TwoPane delta ratio
        nmaster = 1
        ratio   = 1/2
        delta   = 2/100


main = do
    xmobar <- spawnPipe "xmobar"

    xmonad $ gnomeConfig
        { modMask           = myModMask
        , workspaces        = myWorkspaces
        , focusFollowsMouse = myFocusFollowsMouse
        , layoutHook        = myLayoutHook
        , logHook           = myLogHook xmobar
        , manageHook        = manageHook gnomeConfig <+> myManageHook
        }
        `additionalKeysP` myKeysP
        `additionalKeys` myKeys

