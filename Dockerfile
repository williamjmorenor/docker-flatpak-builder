  
from fedora:rawhide

RUN dnf install -y flatpak && dnf clean all
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y --noninteractive flathub \
    org.flatpak.Builder \
    org.freedesktop.Platform \
    org.freedesktop.Platform.Locale \
    org.freedesktop.Platform.ffmpeg-full \
    org.freedesktop.Platform.GL.default \
    org.freedesktop.Platform.GL.mesa-aco \
    org.freedesktop.Sdk \
    org.freedesktop.Sdk.Locale \
    org.freedesktop.Sdk.Extension.rust-stable \
    org.gnome.Platform \
    org.gnome.Platform.Locale \
    org.gnome.Sdk \
    org.gnome.Sdk.Locale \
    org.kde.Platform \
    org.kde.Platform.Locale \
    org.kde.Sdk \
    org.kde.Sdk.Locale
