# Weather app using Flutter

This is a weather app demonstration using Flutter.

## Important
1. Although it is possible to Dockerize this app, running an Android emulator (at least) from within a Docker container may pose some issues.
2. The steps on installing a Docker emulator for an Android device can be found here https://github.com/google/android-emulator-container-scripts .  This repository states that it is still an experimental feature and the images provided or described in this repository will not run in a Windows or Mac parent environment.
3. Installing Flutter directly into the parent environment is still the fastest and reliable way of running flutter apps which are under development.
4. This app should also work in iOS emulators, but testing was not possible on my end for verification.

## Installation
1. Make sure that flutter has been installed in the parent environment.  Please refer to this document on how to properly install flutter:  https://docs.flutter.dev/get-started/install
2. Once installed, clone this repository by running ``` git clone git@github.com:codemyguitar/acquire_flutter.git ```
3. cd into the ``` acquire_flutter ``` directory
4. To list the available emulators, ``` flutter emulators ```
5. To launch a specific emulator, ``` flutter emulators --launch [emulator ID] ```
6. When the emulator is running do a ``` flutter pub get ```
7. To run the application in the currently running Android or iOS emulator, do a ``` flutter run ```

## NOTES ON HOW TO USE AND DEPLOY
1. The app sends API requests to https://openweathermap.org/ specifically to http://api.openweathermap.org/data/2.5/weather
2. The API token is currently hard coded into the app since there is no other backend system where the token can be requested from.  But if this is to be in production, we strongly suggest to NOT store the API token from within the code base.  This is only for demonstration purposes on how to untilize Flutter.
3. The app will auto detect your current location.  <strong>Please allow the app to use your current location when asked</strong>.  Please refer to screenshots below for reference (Android):

![access_location](https://github.com/user-attachments/assets/ac58f9dd-321f-49df-b9f1-daf6dc9b1164)

4. Once allowed, the app will use the city name of your current location to query the API endpoint.
5. To build and release an app into Playstore, please refer to this documentation:  https://docs.flutter.dev/deployment/android
6. To build and release an app for the App Store, please refer to this documentation:  https://docs.flutter.dev/deployment/ios

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
