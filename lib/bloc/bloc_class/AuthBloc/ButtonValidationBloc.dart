import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/events/AuthEvents/ButtonValidationEvent.dart';
import 'package:news_app/bloc/states/AuthStates/ButtonValidationState.dart';

class SignInButtonValidationBloc
    extends Bloc<ButtonValidationEvent, SignInButtonvalidationstate> {
  SignInButtonValidationBloc() : super(SignInDisableState()) {
    on<ButtonEnableDisableEvent>((event, emit) async {
      if (EmailValidator.validate(event.email ?? "") &&
          event.password!.length >= 6) {
        emit(SignInEnableState(email: event.email, password: event.password));
      } else {
        emit(SignInDisableState());
      }
    });
  }
}



class SignUpButtonValidationBloc
    extends Bloc<ButtonValidationEvent, SignUpButtonvalidationstate> {
   SignUpButtonValidationBloc() : super(SignUpDisableState()) {
    on<ButtonEnableDisableEvent>((event, emit) async {
      if (EmailValidator.validate(event.email ?? "") &&
          event.password!.length >= 6) {
        emit(SignUpEnableState(email: event.email, password: event.password));
      } else {
        emit(SignUpDisableState());
      }
    });
  }
}
