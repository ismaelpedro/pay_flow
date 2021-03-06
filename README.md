<img src=".github/layout.png" alt="Layout App PayFlow">
<br>

<h2>Layout πΊοΈ</h2>

The layout was developed by [Tiago Luchtenberg](https://www.instagram.com/tiagoluchtenberg/), and you can access it on Figma: 
[Layout](https://www.figma.com/file/kLK7FYnWKMoN68sQXcSniu)

<h2>Tecnologies β¨</h2> 

This project was developed with the following technologies:

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- [Hasura](https://hasura.io/)

<h2>Project π»</h2>

It was developed to facilitate the handling and storage of boletos, a very common means of payment in Brazil. 
PayFlow contains features such as using Camera, Sign In, Custom Animations and Stylizations. 
I'm using: 
- Clean Architecture; 
- Unitary Tests;
- Hasura for BaaS;
- GetX (for state management, dependency injection and internationalization);

<h2> Features implemented π₯ </h2>

- Login with Google;
- Barcode reading;
- Internationalization (PT-BR, EN-US, ES-ES);
- Shimmer effects on loads;

<h2> How to run? π</h2>

- Clone the repository;
- Enter the project folder;
- Run `flutter pub get` to install all project dependencies/packages;
- Find `"hasura_settings_example.env"` in "assets/", rename to `"hasura_settings.env"`;
- Fill your hasura data in `"hasura_settings.env"`;
- Launch a mobile device emulator or connect your smartphone to the computer <br>
  `(make sure your device has USB Debugging enabled)`;
- Run `flutter run` to run the app on your connected (or emulated) device;


<h2>How to Contribute πͺ</h2>

   ```
   - Fork the project 

   - Create a new branch with your changes:
   $ git checkout -b my-feature

   - Save your changes and create a commit message telling you what you did:
   $ git commit -m "feature: My new feature"

   - Submit your changes:
   $ git push origin my-feature
   ```
