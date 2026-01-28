class SignInButtonvalidationstate {}

class SignInEnableState extends SignInButtonvalidationstate {
  String? email;
  String? password;
  SignInEnableState({required this.email, required this.password});
}

class SignInDisableState extends SignInButtonvalidationstate {}



class SignUpButtonvalidationstate {}

class SignUpEnableState extends SignUpButtonvalidationstate {
  String? email;
  String? password;
  SignUpEnableState({required this.email, required this.password});
}

class SignUpDisableState extends SignUpButtonvalidationstate {}





