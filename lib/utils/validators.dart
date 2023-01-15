bool isValidEmailAddress(String email) {
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  return emailRegExp.hasMatch(email);
}

bool isPasswordValidLenth(String password) {
  // TODO: Implement customization
  return password.length > 5;
}

bool isPasswordValidSpecialCharacter(String password) {
  // TODO
  return true;
}

bool isPasswordValidUppercaseCharacter(String password) {
  // TODO
  return true;
}
