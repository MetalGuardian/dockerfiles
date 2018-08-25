FROM openjdk:8-jdk

ENV LANG en_US.UTF-8
ENV ANDROID_HOME="/opt/android-sdk-linux"
ENV ANDROID_SDK_HOME="${ANDROID_HOME}"
ENV ANDROID_SDK_ROOT="${ANDROID_SDK_HOME}"
ENV PATH="${PATH}:${ANDROID_SDK_HOME}/emulator:${ANDROID_SDK_HOME}/tools:${ANDROID_SDK_HOME}/tools/bin:${ANDROID_SDK_HOME}/platform-tools"
ENV ANDROID_COMPILE_SDK="26"
ENV ANDROID_BUILD_TOOLS="26.0.3"
ENV VERSION_SDK_TOOLS "4333796"

RUN apt-get update

RUN apt-get install -y locales wget unzip
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen

RUN mkdir -p ${ANDROID_HOME} && \
    cd ${ANDROID_HOME} && \
    wget -q https://dl.google.com/android/repository/sdk-tools-linux-${VERSION_SDK_TOOLS}.zip -O android_tools.zip && \
    unzip android_tools.zip && \
    rm android_tools.zip

RUN yes | sdkmanager --licenses

RUN sdkmanager --update

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -yq nodejs

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -yq yarn

RUN npm install -g react-native-cli

CMD ["bash"]

#RUN sdkmanager "build-tools;${ANDROID_BUILD_TOOLS}"
#RUN sdkmanager "platforms;android-${ANDROID_COMPILE_SDK}"
RUN sdkmanager "platform-tools"
RUN sdkmanager "build-tools;25.0.3"
RUN sdkmanager "platforms;android-25"
