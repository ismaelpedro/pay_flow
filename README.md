# PayFlow

PayFlow contains features such as using Camera, Sign In, Custom Animations and Stylizations. 
I'm using: 
- Clean Architecture; 
- Unitary Tests;
- Hasura
- GetX (for state management, dependency injection and internationalization);


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

 ```

- Clone the repository;
- Enter the project folder;
- Run `flutter pub get` to install all project dependencies/packages;
- Find "hasura_settings_example.env" in "assets/", and rename to "hasura_settings.env" and fill your hasura data;
- Put your "google-services.json" in "/android/app/";
- Put your "keystore.jks" in "/android/app/";
- Put your "GoogleService-Info.plist" in "/ios/Runner/";
- Launch a mobile device emulator or connect your smartphone to the computer (make sure your device has USB Debugging enabled);
- Run `flutter run` to run the app on your connected (or emulated) device;

 ```

<h2 align="center">How to Contribute 💪</h2>

   ```
   - Fork the project 

   - Create a new branch with your changes:
   $ git checkout -b my-feature

   - Save your changes and create a commit message telling you what you did:
   $ git commit -m "feature: My new feature"

   - Submit your changes:
   $ git push origin my-feature
   ```

---

<h2 align="center">License 📝</h2>

<p align="center">
   This repository is under MIT license. You can see the <a href="https://github.com/felipecastrosales/DevQuiz/blob/master/LICENSE">LICENSE</a> file for more details. 😉
</p>
