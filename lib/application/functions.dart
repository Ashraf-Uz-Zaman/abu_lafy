


bool isEmailValid(String email) {
  return RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}

bool isPasswordValid(String password) {
  return RegExp(r".{6,15}").hasMatch(password);
}

bool isPhoneValid(String phone) {
  return  RegExp(r"\+966+5+[0-9]{8,9}").hasMatch(phone);
}

bool isPhoneStartWithZero(String phone) {
  return  RegExp(r"05+[0-9]{8,9}").hasMatch(phone);
}

bool isTextEmpty(String text){
  return text.isNotEmpty;
}