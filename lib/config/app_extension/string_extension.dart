extension StringExtension on String{

  bool isValidEmail(){
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(this);
  }


  bool isValidPhone() {
    return RegExp(
      r'^\+?\d{1,3}\s?\d{1,14}$',
    ).hasMatch(this);
  }
}