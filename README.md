# PayFlow

PayFlow contains features such as using Camera, Sign In, Custom Animations and Stylizations. 
I'm using: 
- Clean Architecture; 
- Unitary Tests;
- GetX (for state management, dependency injection and internationalization);
- Hasura

## Layout

<img src=".github/layout.png" alt="Layout App PayFlow">
<br>

The layout was developed by [Tiago Luchtenberg](https://www.instagram.com/tiagoluchtenberg/), and you can access it on Figma: 
[Layout](https://www.figma.com/file/kLK7FYnWKMoN68sQXcSniu)

## Features implemented

- Login with Google;
- Barcode reading;
- Register a new bank slip;
- List bank slip;
- Delete bank slip;
- Navigation menu;
- Internationalization (PT-BR, EN-US, ES-ES);
- Shimmer effects on loads;

## How to run?

- Clone the repository;
- Enter the project folder;
- Run `flutter pub get` to install all project dependencies/packages;
- Find "hasura_settings_example.env" in "assets/hasura_settings_example.env", and rename to "hasura_settings.env" and fill your hasura data;
- Put your "google-services.json" in "/android/app/google-services.json";
- Put your "keystore.jks" in "/android/app/keystore.jks";
- Put your "GoogleService-Info.plist" in "/ios/Runner/GoogleService-Info.plist";
- Launch a mobile device emulator or connect your smartphone to the computer (make sure your device has USB Debugging enabled);
- Run `flutter run` to run the app on your connected (or emulated) device;
