class ValidationEvent {}

class EmailValidationEvent extends ValidationEvent {
  final String? email;
  
  EmailValidationEvent({required  this.email});
}

class PasswordValidationEvent extends ValidationEvent {
  
  final String? password;
  PasswordValidationEvent({required this.password});
}

