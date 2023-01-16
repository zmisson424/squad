import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:squad/models/user.dart' as squad_user;

class AuthRepository {
  // Firebase Authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Google Auth Library
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthRepository();

  /// Stream user information from firebase
  /// This will watch for user changes in the backend
  /// or token expirations
  Stream<squad_user.User> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final squad_user.User user = firebaseUser == null
          ? squad_user.User.empty
          : squad_user.User(
              id: firebaseUser.uid,
              email: firebaseUser.email,
              name: firebaseUser.displayName ?? '',
            );
      return user;
    });
  }

  /// Grab current user if needed
  squad_user.User get currentUser {
    User? firebaseUser = _firebaseAuth.currentUser;
    final squad_user.User user = firebaseUser == null
        ? squad_user.User.empty
        : squad_user.User(
            id: firebaseUser.uid,
            name: firebaseUser.displayName ?? '',
            email: firebaseUser.email,
          );
    return user;
  }

  /// Firebase Logout
  /// This will logout of all forms of social account providers
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
      //await _googleSignIn.signOut();
    } catch (_) {
      throw LogOutFailure();
    }
  }

  /// Create account with Email and Password
  /// This is for email login
  /// Accounts will automatically be created for socials on login
  Future<void> createAccountWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      _firebaseAuth.currentUser?.updateDisplayName(name);
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Email and Password Login
  Future<void> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Request password reset
  /// This will trigger an email sent via Firebase
  /// Check out Firebase Auth Documentation to edit and change
  /// email template.
  Future<void> requestPasswordReset({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw ResetPasswordResetFailure.fromCode(e.code);
    } catch (_) {
      throw const ResetPasswordResetFailure();
    }
  }

  // Handles Google Login Authentication
  Future<void> loginWithGoogle() async {
    try {
      GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleAccount!.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }
}

/// Error list for Sign Up with Email and Password
/// TODO Add L10N
class SignUpWithEmailAndPasswordFailure implements Exception {
  const SignUpWithEmailAndPasswordFailure(
      {this.message = 'An unknown error occurred'});

  factory SignUpWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            message: 'Email is not valid');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            message: 'This user has been disabled. Contact support for help');
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            message: 'An account already exists');
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            message: 'Not allowed. Contact support for help.');
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            message: 'Please enter a stronger password.');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

/// Login Wigh Email And Password issues
/// TODO Add L10N
class LogInWithEmailAndPasswordFailure implements Exception {
  const LogInWithEmailAndPasswordFailure(
      {this.message = 'An unknown error has occured.'});

  factory LogInWithEmailAndPasswordFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure(
            message: 'Email is invalid');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            message: 'This user has been disabled. Contact support for help');
      case 'user-not-found':
      case 'wrong-password':
        return const LogInWithEmailAndPasswordFailure(
            message: 'Unable to login with email or password.');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }

  final String message;
}

/// List of logout failure excpetions
/// TODO: Implent and L10N
class LogOutFailure implements Exception {}

/// Password Reset Excpetions
/// TODO: L10N
class ResetPasswordResetFailure implements Exception {
  const ResetPasswordResetFailure({
    this.message = 'An unknown error has occured.',
  });

  factory ResetPasswordResetFailure.fromCode(String code) {
    switch (code) {
      case 'invalid-email':
        return const ResetPasswordResetFailure(
          message: 'Invalid email address',
        );
      case 'missing-continue-uri':
        return const ResetPasswordResetFailure(
          message: 'Must provided a continue URI',
        );
      case 'user-not-found':
        return const ResetPasswordResetFailure(
          message: 'Account not found for provided email address.',
        );
      default:
        return const ResetPasswordResetFailure();
    }
  }

  final String message;
}

/// Google Failures
/// TODO: L10N
class LogInWithGoogleFailure implements Exception {
  const LogInWithGoogleFailure(
      {this.message = 'An unknown error has occured.'});

  factory LogInWithGoogleFailure.fromCode(String code) {
    switch (code) {
      case 'account-exists-with-different-credential':
        return const LogInWithGoogleFailure(
            message: 'Account exists with different credentials.');
      case 'invalid-credential':
        return const LogInWithGoogleFailure(
            message: 'The credential received is invalid or expired');
      case 'operation-not-allowed':
        return const LogInWithGoogleFailure(
          message: 'Operation is not allowed.  Please contact support.',
        );
      case 'user-disabled':
        return const LogInWithGoogleFailure(
          message:
              'This user has been disabled. Please contact support for help.',
        );
      case 'user-not-found':
      case 'wrong-password':
        return const LogInWithGoogleFailure(
          message: 'Incorrect password, please try again.',
        );
      case 'invalid-verification-code':
        return const LogInWithGoogleFailure(
          message: 'The credential verification code received is invalid.',
        );
      case 'invalid-verification-id':
        return const LogInWithGoogleFailure(
          message: 'The credential verification ID received is invalid.',
        );
      default:
        return const LogInWithGoogleFailure();
    }
  }

  final String message;
}
