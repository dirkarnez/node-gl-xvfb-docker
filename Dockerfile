FROM bengreenier/docker-xvfb:buster

RUN apt update && apt upgrade -y
RUN apt-get -y --no-install-recommends install \
    libx11-dev \
    libxext-dev \
    libxi-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    libglew-dev \
    libglm-dev \
    mesa-utils

RUN apt-get -y --no-install-recommends install \
    curl \
    pkg-config \
    build-essential \
    ca-certificates \
    bash \
    npm

RUN curl -fsSL https://deb.nodesource.com/setup_18.x --output setup.sh

RUN bash ./setup.sh 

RUN apt-get -y --no-install-recommends install  \
    nodejs \
    python3

RUN npm install -g npm@latest


RUN mkdir -p /app
WORKDIR /app
COPY . .
RUN npm install
RUN npm run-script build
CMD [ "node", "." ]
