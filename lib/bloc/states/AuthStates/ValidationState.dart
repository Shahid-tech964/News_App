class EmailValidationState {}

class InitialEmailValidationState extends EmailValidationState{}

class ValidEmail extends EmailValidationState {
  String? message;
  ValidEmail({required this.message});
}

class InValidEmail extends EmailValidationState {
  String? message;
  InValidEmail({required this.message});
}



class PasswordValidationState {}

class InitialPasswordValidationState extends PasswordValidationState{}

class ValidPassword extends PasswordValidationState {
  String? message;
  ValidPassword({required this.message});
}

class InValidPassword extends PasswordValidationState {
  String? message;
  InValidPassword({required this.message});
}



