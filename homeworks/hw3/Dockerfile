FROM ros:melodic-ros-base


RUN mkdir -p homework/homework3/cpp \
    mkdir -p homework/homework3/python

# homework folder creation and PID homework repo downloading
RUN cd homework/homework3/cpp && \
    git clone https://github.com/udacity/CarND-PID-Control-Project.git && \
    cd CarND-PID-Control-Project && sudo apt-get update && \
    sudo apt-get install git libuv1-dev libssl-dev gcc g++ cmake make unzip wget -y && \
    git clone https://github.com/uWebSockets/uWebSockets && \
    cd uWebSockets && \
    git checkout e94b6e1 && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make  && \
    sudo make install && \
    cd .. && \
    cd .. && \
    sudo ln -s /usr/lib64/libuWS.so /usr/lib/libuWS.so && \
    sudo rm -r uWebSockets

# udacity simulator installation
RUN cd homework/homework3 && \
    wget https://github.com/udacity/self-driving-car-sim/releases/download/v1.45/term2_sim_linux.zip && \
    unzip term2_sim_linux.zip && rm term2_sim_linux.zip && cd term2_sim_linux && \
    sudo chmod +x term2_sim.x86_64 && rm term2_sim.x86

# zsh and oh-my-zsh installation
RUN sudo apt install --yes zsh &&\
    set -uex; \
    wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh; \
    sh ./install.sh; \
    rm ./install.sh

# vs code installation
RUN sudo apt install --yes apt-utils libasound2 curl; \
    echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" | sudo \
    tee /etc/apt/sources.list.d/vs-code.list; \
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg; \
    sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg; \
    sudo apt update; \
    sudo apt install --yes code

ADD ./control.py homework/homework3/python/control.py
ADD ./pid.py homework/homework3/python/pid.py

ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
