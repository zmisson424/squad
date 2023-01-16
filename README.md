# Squad

An open source version of Slack and Teams.

## Introducion

TODO

# Issues of Note

- Firebase does not support Windows and Linux

## Requirements

- Firebase Account

## Getting Started

## Architecture

## Firebase

See how to install firebase in Flutter project.

## Bloc

## Authorization

Authorization is built into Firebase. [Learn More](https://firebase.google.com/docs/auth) The
following methods are provided by this project.

- Email and Password
- Google
- Apple **Disabled by default**
- Facebook **Disabled by default**
- Github **Disabled by default**
- Twitter **Disabled by default**
- Microsoft **Disabled by default**

All authroization methods can be enabled or disabled from the [Customization Dart File](#Customization-Dart-File).

**Note** If using any login service other than Email and Password then "Sign in with Apple" must
be enabled on Apple devices (Mac and iPhone) if submitting or going through the App Store.
[Apple Sign In Documentation](https://developer.apple.com/sign-in-with-apple/get-started)

#### Email and Password

Log in with a provided email and password. To create a new account with an email and password the user
will have to provide a valid email and a password that meets the defined requirements (length,
uppercase letter, and a special character). **Note** Firebase Auth requires a password be at least
6 characters long.

Forgot Password - A password reset email can be sent to a user when they forget their login
credentials. The email address must be valid and correspond to a current account. The Forgot
Password email template can be changed inside the Firebase Authentication tab.

Verify Email Address - Not currently implemented // TODO

#### Google Login

Google Authentication requires the offical [plugin](https://pub.dev/packages/google_sign_in) provided
by the flutter team. Follow the documentation to register your application with Google. **Note** Make
sure to enable Google in the Firebase Auth panel.

To enable on Web make sure to provide your GOOGLE_SIGN_IN_OAUTH_CLIENT_ID in the <meta> tag in
web/index.html

#### Apple Login

Apple Authentication will utilize this [sign_in_with_apple](https://pub.dev/packages/sign_in_with_apple)
plugin. This feature will require a paid Apple Developer account. Follow all of the instructions
provided with the plugin to configure this app to work with your Apple account. **Note** Make
sure to enable Google in the Firebase Auth panel.

#### Facebook Login

#### Twitter Login

#### Github Login

#### Microsoft Login

#### Multi Factor Authentication

In development. This is built in with Firebase. **Requires either the Spark or Blaze Plan**

## Customization Dart File

This project is designed to be easily modified by developers or none developers. This cusomization
file allows for quick theming, authorization methods, password requirements and more.

### Email and Password Sign Up Requirements

### Forgot Password email template setup / Firebase
