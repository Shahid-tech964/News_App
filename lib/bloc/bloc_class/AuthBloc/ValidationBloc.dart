import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/events/AuthEvents/ValidationEvent.dart';
import 'package:news_app/bloc/states/AuthStates/ValidationState.dart';

class SignINEmailValidationbloc extends Bloc<ValidationEvent, EmailValidationState> {
  SignINEmailValidationbloc() : super(InitialEmailValidationState()) {
    on<EmailValidationEvent>((event, emit) async {
      if (!EmailValidator.validate(event.email ?? "")) {
        emit(InValidEmail(message: "Please Enter Valid Email"));
      } else if (event.email=="") {
        emit(InValidEmail(message: "Email Shouldn't be Empty "));
      } else {
        emit(ValidEmail(message: "Valid Email"));
      }
    });
  }
}



class SignInPasswordValidationBloc extends Bloc<ValidationEvent, PasswordValidationState> {
  SignInPasswordValidationBloc() : super(InitialPasswordValidationState()) {
    on<PasswordValidationEvent>((event, emit) async {
      if (event.password!.length<6) {
        emit(InValidPassword(message: "Password Length Should be 6 or greater than 6"));
      } else if (event.password=="") {
        emit(InValidPassword(message: "Password Shouldn't be Empty "));
      } else {
        emit(ValidPassword(message: "Valid Password"));
      }
    });
  }
}






class SignUpEmailValidationbloc extends Bloc<ValidationEvent, EmailValidationState> {
 SignUpEmailValidationbloc() : super(InitialEmailValidationState()) {
    on<EmailValidationEvent>((event, emit) async {
      if (!EmailValidator.validate(event.email ?? "")) {
        emit(InValidEmail(message: "Please Enter Valid Email"));
      } else if (event.email!.isEmpty) {
        emit(InValidEmail(message: "Email Shouldn't be Empty "));
      } else {
        emit(ValidEmail(message: "Valid Email"));
      }
    });
  }
}



class SignUpPasswordValidationBloc extends Bloc<ValidationEvent, PasswordValidationState> {
  SignUpPasswordValidationBloc() : super(InitialPasswordValidationState()) {
    on<PasswordValidationEvent>((event, emit) async {
      if (event.password!.length<6) {
        emit(InValidPassword(message: "Password Length Should be 6 or greater than 6"));
      } else if (event.password!.isEmpty) {
        emit(InValidPassword(message: "Password Shouldn't be Empty "));
      } else {
        emit(ValidPassword(message: "Valid Password"));
      }
    });
  }
}
