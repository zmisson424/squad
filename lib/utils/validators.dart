bool isValidEmailAddress(String email) {
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  return emailRegExp.hasMatch(email);
}

bool isPasswordValidLenth(String password) {
  // TODO: Implement customization
  return password.length >= 5;
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
