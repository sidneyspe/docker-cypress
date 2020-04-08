FROM ubuntu

MAINTAINER Sidney Pimentel <sidneyspe@gmail.com>

# SYSTEM  UPDATE AND INSTALL UTILITIES
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    gnupg 
#
# UPDATE DEPENDENCES FOR NODEJS 12
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash
#
# ADD YARN
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo 'deb https://dl.yarnpkg.com/debian/ stable main' | tee /etc/apt/sources.list.d/yarn.list
#
# INSTALL NODEJS YARN GIT
RUN apt-get update && apt-get install -y \
    nodejs \
    yarn \
    git 
#
# DEPENDENCES FOR CYPRESS
RUN apt-get -y install \
    libgtk2.0-0 \
    libgtk-3-0 \
    libnotify-dev \
    libgconf-2-4 \
    libnss3 \
    libxss1 \
    libasound2 \
    libxtst6 \
    xauth \
    xvfb 
#
# COMMAND FOR EXECUTE CHROME HEADLENESS    
RUN Xvfb -ac -screen scrn 1280x2000x24 :9.0 &
RUN export DISPLAY=:9.0
#
# DOWNLOAD CHROME
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb