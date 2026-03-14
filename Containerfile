FROM quay.io/fedora/fedora-bootc:43-aarch64

RUN microdnf install -y \
    cockpit \
    git \
    grub2-efi-aa64-modules \
    grub2-efi-x64-modules \
    grub2-tools-extra \
    neovim \
    openssl \
    yq \
    zsh \
&& \
    dnf clean all

