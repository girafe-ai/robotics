FROM ros:melodic-ros-base
FROM ros:melodic-robot
FROM ros:melodic-perception

RUN apt update && \
    apt install -y less git vim wget zsh tmux apt-transport-https && \
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' && \
    apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 && \
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/ && \
    rm packages.microsoft.gpg && \
    apt update && \
    apt install -y ros-melodic-desktop-full code && \
    code --user-data-dir=/vscode --install-extension ms-vscode.cmake-tools && \
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
    sh -c 'echo "source /opt/ros/melodic/setup.zsh" >> /root/.zshrc' && \
    sh -c 'echo "alias code=\"code --user-data-dir=/vscode\"" >> /root/.zshrc' && \
    chsh -s /usr/bin/zsh

ENTRYPOINT zsh
