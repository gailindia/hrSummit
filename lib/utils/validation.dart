class AppValidation {
   
  static final RegExp passwordValidatorRegExp = RegExp(
    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'
  );

 
  static final RegExp onlyAlpha = RegExp(r"^[a-zA-Z ]+$");

 
  static final RegExp emailValidatorRegExp = RegExp(
    r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  );

  /// Regular expression for phone number validation (5-15 digits)
  static final RegExp phoneValidatorRegExp = RegExp(r'(^\d{5,15}$)|(^\d{5}-\d{4}$)');

   String? userIdOrEmailValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter username';
    }  
    return null;
  }

   String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Please enter password';
    }  
    return null;
  }

}