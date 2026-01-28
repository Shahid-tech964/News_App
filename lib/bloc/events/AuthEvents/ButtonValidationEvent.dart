class ButtonValidationEvent {}


class ButtonEnableDisableEvent extends ButtonValidationEvent{
  String? email;
  String? password;
  ButtonEnableDisableEvent({required this.email, required this.password});
}