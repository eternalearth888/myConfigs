import XMonad
import XMonad.Layout.NoBorders
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import XMonad.Hooks.ManageDocks

main = do
	xmPipe <- spawnPipe "xmobar ~/.xmobarrc"
	
	xmonad $ defaultConfig {
		layoutHook = avoidStruts $ smartBorders $ layoutHook defaultConfig
		, terminal = "gnome-terminal"
		, logHook = dynamicLogWithPP $ xmobarLogHook xmPipe
	}	

xmobarLogHook pipe = xmobarPP {
	ppOutput	= hPutStrLn pipe
	, ppCurrent = xmobarColor "green" ""
	, ppTitle	= xmobarColor "green" "" . shorten 100
}
