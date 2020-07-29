  
from fedora:rawhide

RUN dnf install -y flatpak git bash wget && dnf clean all
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y --noninteractive flathub \
    org.flatpak.Builder \
    org.freedesktop.Platform//19.08 \
    org.freedesktop.Platform.Locale//19.08 \
    org.freedesktop.Platform.ffmpeg-full//19.08 \
    org.freedesktop.Platform.GL.default//19.08 \
    org.freedesktop.Sdk//19.08 \
    org.freedesktop.Sdk.Locale//19.08 \
    org.freedesktop.Sdk.Extension.rust-stable//19.08 \
    org.freedesktop.Platform.openh264//19.08 \ 
    org.gnome.Platform//3.36 \
    org.gnome.Platform.Locale//3.36 \
    org.gnome.Sdk//3.36 \
    org.gnome.Sdk.Locale//3.36 \
    org.kde.Platform//5.14 \
    org.kde.Platform.Locale//5.14 \
    org.kde.Sdk//5.14 \
    org.kde.Sdk.Locale//5.14

# Create a user to not run packaging tasks as root
RUN useradd -ms /bin/bash packager
# Let the packager user become root.
RUN usermod -a -G wheel packager
# Use sudo without password.
RUN echo "packager ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
# Define user and home for packaging.
USER packager
WORKDIR /home/packager
VOLUME /home/packager
ENTRYPOINT [ "/usr/bin/bash" ]

