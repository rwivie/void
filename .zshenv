typeset -U path PATH
path=(~/.local/bin ~/.cargo/bin ~/.local/bin/statusbar ~/.local/bin/statusbar_ls ~/.local/bin/dwl ~/.config/fzf-nova ~/python_venv/bin ~/.local/share/gem/ruby/3.3.0/bin $path)
export PATH

#==== exports
export EDITOR='nvim'
export VISUAL='nvim'
#export EDITOR='nvr --remote-silent'
#export VISUAL='nvr --remote-silent'
export BROWSER="firefox"
export XBPS_DISTDIR=/home/ron/void-packages
export TERMINAL="kitty"
export XDG_RUNTIME_DIR=/var/run/user/$(id -u)
#export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
#export MANPAGER='sh -c "col -bx | bat -l man -p"'

#==== wayfire exports
#export XDG_SESSION_TYPE=wayland
#export XDG_SESSION_DESKTOP=wayfire
#export XDG_CURRENT_DESKTOP=wayfire
#export XDG_CURRENT_SESSION=wayfire

#export MOZ_ENABLE_WAYLAND=1
#export MOZ_DBUS_REMOTE=1

#export QT_QPA_PLATFORMTHEME=qt5ct
#export QT_AUTO_SCREEN_SCALE_FACTOR=1
#export QT_WAYLAND_DISABLE_WINDOWDECORATION=1

#==== qt5ct
export QT_QPA_PLATFORMTHEME=qt6ct
#export QT_STYLE_OVERRIDE=kvantum

#==== zoxide
export _ZO_ECHO=1
export _ZO_RESOLVE_SYMLINKS=1

#==== use either mesa's radv or amd's amdvlk
#AMD_VULKAN_ICD=AMDVLK
export AMD_VULKAN_ICD=RADV


export LIBVA_DRIVER_NAME=radeonsi
#export VDPAU_DRIVER=nvidia
export VDPAU_DRIVER=radeonsi
#export VDPAU_DRIVER=radeonsi_drv_video
