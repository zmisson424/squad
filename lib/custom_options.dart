/// Configuration file to easily update settings and configurations
/// for the platform.
///

class CustomOptions {
  /// *******************************************
  ///             Sign In Settings
  /// *******************************************

  // Google Login Enabled
  static bool allowGoogleSignIn = true;

  // Apple Login Enabled
  static bool allowAppleSignIn = true;

  // Facebook Login Enabled
  static bool allowFacebookSignIn = false;

  // Github Login Enabled
  static bool allowGithubSignIn = false;

  // Email and Password Login Enabled
  static bool allowEmailSignIn = false;

  /// The minimum length a password must be
  /// NOTE: The minimum accepted length is
  /// 6 per Firebase specifications
  static int passwordRequirementLength = 6;

  /// When creating a new account with email
  /// and password
  /// The password will require at least one
  /// uppercase letter
  static bool passwordRequirementUppercaseLetter = true;

  /// When creating a new account with email
  /// and password
  /// The password will require at least one
  /// special character
  static bool passwordRequirementSpecialCharacter = true;
}
