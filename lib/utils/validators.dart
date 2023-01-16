import 'package:squad/custom_options.dart';

bool isValidEmailAddress(String email) {
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  return emailRegExp.hasMatch(email);
}

bool isPasswordValidLenth(String password) {
  int minimumRequirement = CustomOptions.passwordRequirementLength;
  if (minimumRequirement < 6) {
    minimumRequirement = 6;
  }
  return password.length >= minimumRequirement;
}

bool isPasswordValidSpecialCharacter(String password) {
  final RegExp specialCharacterRegExp = RegExp(
    r'[!@#$%^&*(),.?":{}|<>]',
  );
  return specialCharacterRegExp.hasMatch(password);
}

bool isPasswordValidUppercaseCharacter(String password) {
  final RegExp uppercaseRegExp = RegExp(
    r'[A-Z]',
  );
  return uppercaseRegExp.hasMatch(password);
  ;
}
