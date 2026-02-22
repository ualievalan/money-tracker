FROM --platform=linux/amd64 ghcr.io/cirruslabs/flutter:stable

RUN apt-get update && apt-get install -y ruby-full build-essential \
    && gem install bundler fastlane fastlane-plugin-firebase_app_distribution \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /builds/project
