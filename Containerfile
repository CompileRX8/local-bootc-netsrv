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

# -- User setup --
ARG USERNAME
ARG PASSWORD

RUN groupadd -g 1000 ${USERNAME} \
    && useradd -m -u 1000 -g 1000 -G wheel -s /bin/zsh ${USERNAME} \
    && echo "${USERNAME}:${PASSWORD}" | chpasswd \
    && mkdir -p /home/${USERNAME} \
    && chown ${USERNAME}:${USERNAME} /home/${USERNAME} \
    && chmod 700 /home/${USERNAME}

# -- Finalize container setup --
RUN bootc container lint

