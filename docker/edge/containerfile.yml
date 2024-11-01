FROM fedora:41


RUN rpm --import https://packages.microsoft.com/keys/microsoft.asc
RUN dnf config-manager --add-repo https://packages.microsoft.com/yumrepos/edge
RUN dnf update --refresh
RUN dnf install microsoft-edge-stable opensc
