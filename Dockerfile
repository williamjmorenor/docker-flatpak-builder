  
from fedora:rawhide

RUN dnf install -y flatpak && dnf clean all
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN flatpak install flathub org.flatpak.Builder \
    org.freedesktop.Platform* org.freedesktop.Sdk* \
    org.gnome.Platform* \
    org.gnome.Sdk* \
    org.kde.Platform* \
    org.kde.Sdk*
