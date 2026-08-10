-- Hyprland Lua Config

------------------
---- MONITORS ----
------------------
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

---------------------
---- MY PROGRAMS ----
---------------------
local terminal = "kitty"
local fileManager = "thunar"
local menu = "tofi-drun -c ~/.config/tofi/configA --drun-launch=true"
local browser = "brave"
local notes = "obsidian"
local editor = "zeditor"
local editor_alt = "nvim"
local colorPicker = "hyprpicker"

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/bin/dunst")
	hl.exec_cmd("waybar")
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd(
		"sleep 1 && awww img /home/paraizo/Imagens/Walls/missa.jpeg --transition-fps 255 --transition-type outer --transition-duration 0.8"
	)
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd('rm "$HOME/.cache/cliphist/db"')
	hl.exec_cmd("hypridle")
	hl.exec_cmd(
		"dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XAUTHORITY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE"
	)
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("/usr/lib/xdg-desktop-portal-hyprland")
	hl.exec_cmd("/usr/lib/xdg-desktop-portal")
	hl.exec_cmd("/home/paraizo/.local/app/DiscordPTB/discord-ptb --url --start-minimized --start-inactive -- %u")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_SESSION_TYPE", "wayland")
local has_nvidia = os.execute("lspci -nn 2>/dev/null | grep -qiE 'VGA.*\\[.*nvidia|3D.*\\[.*nvidia'") == 0
if has_nvidia then
	hl.env("LIBVA_DRIVER_NAME", "nvidia")
	hl.env("GBM_BACKEND", "nvidia-drm")
	hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
	hl.env("NVD_BACKEND", "direct")
end
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-----------------------
---- LOOK AND FEEL ----
-----------------------
hl.config({
	general = {
		gaps_in = 5,
		gaps_out = 5,
		border_size = 1,
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 5,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		blur = {
			enabled = true,
			size = 2,
			passes = 1,
			new_optimizations = true,
			vibrancy = 0.1696,
			ignore_opacity = true,
		},
	},
	animations = {
		enabled = true,
	},
})

hl.curve("wind", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("winIn", { type = "bezier", points = { { 0.1, 1.1 }, { 0.1, 1.1 } } })
hl.curve("winOut", { type = "bezier", points = { { 0.3, -0.3 }, { 0, 1 } } })
hl.curve("liner", { type = "bezier", points = { { 1, 1 }, { 1, 1 } } })
hl.curve("soft", { type = "bezier", points = { { 0.4, 0.2 }, { 0.2, 1 } } })
hl.curve("overshoot", { type = "bezier", points = { { 0.5, 0.9 }, { 0.1, 1.1 } } })
hl.curve("pop", { type = "bezier", points = { { 0.1, 0.9 }, { 0.1, 1.1 } } })

hl.animation({ leaf = "windows", enabled = true, speed = 6, bezier = "wind", style = "slide" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 6, bezier = "overshoot", style = "popin 75%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "winOut", style = "slide" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 5, bezier = "wind", style = "slide" })
hl.animation({ leaf = "fade", enabled = true, speed = 7, bezier = "soft" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 7, bezier = "soft" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 7, bezier = "soft" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 7, bezier = "soft" })
hl.animation({ leaf = "fadeSwitch", enabled = true, speed = 7, bezier = "soft" })
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "liner" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 30, bezier = "liner", style = "loop" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "wind", style = "slide" })

hl.config({
	dwindle = {
		preserve_split = true,
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		vrr = 0,
	},
	xwayland = {
		force_zero_scaling = true,
	},
})

---------------
---- INPUT ----
---------------
hl.config({
	input = {
		kb_layout = "br, us",
		kb_variant = "abnt2, intl",
		kb_model = "",
		kb_options = "grp:shifts_toggle",
		kb_rules = "",
		left_handed = false,
		natural_scroll = false,
		follow_mouse = 1,
		sensitivity = 0.40,
		repeat_rate = 50,
		repeat_delay = 200,
		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

---------------------
---- KEYBINDINGS ----
---------------------
local mainMod = "SUPER"

-- Apps
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd(notes))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(editor_alt))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + E", hl.dsp.exec_cmd("jome -d | wl-copy"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd(colorPicker .. " | wl-copy"))

-- Windows
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("hyprctl dispatch exit"))
hl.bind(mainMod .. " + W", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())

-- Focus
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move window
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scratchpad
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse drag/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + Z", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + X", hl.dsp.window.resize(), { mouse = true })

-- Resize with keyboard
hl.bind(mainMod .. " + CTRL + Right", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 30 0"), { repeating = true })
hl.bind(mainMod .. " + CTRL + Left", hl.dsp.exec_cmd("hyprctl dispatch resizeactive -30 0"), { repeating = true })
hl.bind(mainMod .. " + CTRL + Up", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 -30"), { repeating = true })
hl.bind(mainMod .. " + CTRL + Down", hl.dsp.exec_cmd("hyprctl dispatch resizeactive 0 30"), { repeating = true })

-- Clipboard
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | tofi -c ~/.config/tofi/configV | cliphist decode | wl-copy"))

-- Lock / Logout
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("wlogout"))

-- Waybar toggle
hl.bind("CTRL + Escape", hl.dsp.exec_cmd("killall waybar || waybar"))

-- Screenshots
hl.bind(
	"Print",
	hl.dsp.exec_cmd("grimblast --notify copysave screen /home/paraizo/Imagens/Prints/$(date +%Y%m%d_%H%M%S).png")
)
hl.bind(
	"SUPER + Print",
	hl.dsp.exec_cmd("grimblast --notify copysave active /home/paraizo/Imagens/Prints/$(date +%Y%m%d_%H%M%S)-window.png")
)
hl.bind(
	"ALT + Print",
	hl.dsp.exec_cmd("grimblast --notify copysave area /home/paraizo/Imagens/Prints/$(date +%Y%m%d_%H%M%S)-area.png")
)

-- Volume
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pamixer -i 5"), { locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pamixer -d 5"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -m"), { locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pamixer -t"), { locked = true })

-- Media
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Brightness
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true })

-- Wallpaper
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.bin/wallpaper-wofi.sh"))

-- Recording
hl.bind(mainMod .. " + F9", hl.dsp.exec_cmd("~/.bin/record-toggle.sh"))

-- Resolution
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.bin/res.sh"))

--------------------------------
---- WINDOW RULES ----
--------------------------------
hl.window_rule({
	name = "windowrule-1",
	match = { class = "^(jome)$" },
	float = true,
})

hl.window_rule({
	name = "windowrule-2",
	match = { class = "^(Thorium-browser)$" },
	opacity = "0.90 0.90",
})

hl.window_rule({
	name = "windowrule-3",
	match = { class = "^(Code)$" },
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-4",
	match = { class = "^(Arduino IDE)$" },
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-5",
	match = { class = "^(dev.warp.Warp)$" },
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-6",
	match = { class = "^(obsidian)$" },
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-7",
	match = { class = "^(code-url-handler)$" },
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-8",
	match = { class = "^(code-insiders-url-handler)$" },
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-9",
	match = { class = "^(kitty)$" },
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-10",
	match = { class = "^(org.gnome.Nautilus)$" },
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-11",
	match = { class = "^(org.kde.ark)$" },
	float = true,
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-12",
	match = { class = "^(nwg-look)$" },
	float = true,
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-13",
	match = { class = "^(qt5ct)$" },
	float = true,
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-14",
	match = { class = "^(qt6ct)$" },
	float = true,
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-15",
	match = { class = "^(kvantummanager)$" },
	float = true,
	opacity = "0.80 0.80",
})

hl.window_rule({
	name = "windowrule-16",
	match = { class = "^(pavucontrol)$" },
	float = true,
	opacity = "0.80 0.70",
})

hl.window_rule({
	name = "windowrule-17",
	match = { class = "^(blueman-manager)$" },
	float = true,
	opacity = "0.80 0.70",
})

hl.window_rule({
	name = "windowrule-18",
	match = { class = "^(nm-applet)$" },
	float = true,
	opacity = "0.80 0.70",
})

hl.window_rule({
	name = "windowrule-19",
	match = { class = "^(Spotify)$" },
	opacity = "1.0 1.0",
})

hl.window_rule({
	name = "windowrule-20",
	match = { initial_title = "^(Spotify Free)$" },
	opacity = "1.0 1.0",
})

hl.window_rule({
	name = "windowrule-21",
	match = { class = "^(nm-connection-editor)$" },
	float = true,
	opacity = "0.80 0.70",
})

hl.window_rule({
	name = "windowrule-22",
	match = { class = "^(org.kde.polkit-kde-authentication-agent-1)$" },
	float = true,
	opacity = "0.80 0.70",
})

hl.window_rule({
	name = "windowrule-23",
	match = { class = "^(polkit-gnome-authentication-agent-1)$" },
	opacity = "0.80 0.70",
})

hl.window_rule({
	name = "windowrule-24",
	match = { class = "^(org.freedesktop.impl.portal.desktop.gtk)$" },
	opacity = "0.80 0.70",
})

hl.window_rule({
	name = "windowrule-25",
	match = { class = "^(org.freedesktop.impl.portal.desktop.hyprland)$" },
	opacity = "0.80 0.70",
})

hl.window_rule({
	name = "windowrule-26",
	match = { class = "^(vesktop)$" },
	opacity = "0.80 0.70",
})

-- No blur for deadlocked overlay
hl.window_rule({
	name = "no-blur-deadlocked",
	match = { title = "^(deadlocked_overlay)$" },
	no_blur = 1,
})

---- LAYER RULES ----
hl.layer_rule({
	name = "layerrule-1",
	match = { namespace = "tofi" },
	ignore_alpha = 0,
})

hl.layer_rule({
	name = "layerrule-2",
	match = { namespace = "dunst" },
	ignore_alpha = 0,
	blur = true,
})
