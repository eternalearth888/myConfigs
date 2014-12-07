import XMonad
import XMonad.Layout.NoBorders

main = do
    xmPipe <- spawnPipe "xmobar"
	xmonad defaultConfig {
		layoutHook = smartBorders $ layoutHook defaultConfig
		, terminal = "gnome-terminal"
		, logHook = dynamicLogWithPP $ xmobarLogHook xmPipe
}

xmobarLogHook pip = xmobarPP {
	ppOutput	= hPutStrLn pipe
	, ppCurrent = xmobarColor "green" ""
	, ppTitle	= xmobarColor "green "" . shorten 100
}
