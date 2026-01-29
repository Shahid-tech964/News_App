import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/viewmodel/events/AuthEvents/ValidationEvent.dart';
import 'package:news_app/viewmodel/states/AuthStates/ValidationState.dart';

class SignINEmailValidationbloc
    extends Bloc<ValidationEvent, EmailValidationState> {
  SignINEmailValidationbloc() : super(InitialEmailValidationState()) {
    on<ResetValidationEvent>((event, emit) {
      emit(InitialEmailValidationState());
    });

    on<EmailValidationEvent>((event, emit) async {
      final email = event.email ?? "";

      if (email.isEmpty) {
        emit(InValidEmail(message: "Email shouldn't be empty"));
      } else if (!EmailValidator.validate(email)) {
        emit(InValidEmail(message: "Please enter a valid email"));
      } else {
        emit(ValidEmail(message: "Valid email"));
      }
    });
  }
}

class SignInPasswordValidationBloc
    extends Bloc<ValidationEvent, PasswordValidationState> {
  SignInPasswordValidationBloc() : super(InitialPasswordValidationState()) {
    on<ResetValidationEvent>((event, emit) {
      emit(InitialPasswordValidationState());
    });
    on<PasswordValidationEvent>((event, emit) async {
      final password = event.password ?? "";

      if (password.isEmpty) {
        emit(InValidPassword(message: "Password shouldn't be empty"));
      } else if (password.length < 6) {
        emit(InValidPassword(message: "Password length should be 6 or more"));
      } else {
        emit(ValidPassword(message: "Valid password"));
      }
    });
  }
}

class SignUpEmailValidationbloc
    extends Bloc<ValidationEvent, EmailValidationState> {
  SignUpEmailValidationbloc() : super(InitialEmailValidationState()) {
    on<ResetValidationEvent>((event, emit) {
      emit(InitialEmailValidationState());
    });
    on<EmailValidationEvent>((event, emit) async {
      final email = event.email ?? "";

      if (email.isEmpty) {
        emit(InValidEmail(message: "Email shouldn't be empty"));
      } else if (!EmailValidator.validate(email)) {
        emit(InValidEmail(message: "Please enter a valid email"));
      } else {
        emit(ValidEmail(message: "Valid email"));
      }
    });
  }
}

class SignUpPasswordValidationBloc
    extends Bloc<ValidationEvent, PasswordValidationState> {
  SignUpPasswordValidationBloc() : super(InitialPasswordValidationState()) {
    on<ResetValidationEvent>((event, emit) {
      emit(InitialPasswordValidationState());
    });
    on<PasswordValidationEvent>((event, emit) async {
      final password = event.password ?? "";

      if (password.isEmpty) {
        emit(InValidPassword(message: "Password shouldn't be empty"));
      } else if (password.length < 6) {
        emit(InValidPassword(message: "Password length should be 6 or more"));
      } else {
        emit(ValidPassword(message: "Valid password"));
      }
    });
  }
}
