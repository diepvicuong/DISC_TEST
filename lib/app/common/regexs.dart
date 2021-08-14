class AppRegex {
  static final mobilePhoneReg = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
  static final emailReg = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final digits = RegExp(r'^\d{6}$');
}
