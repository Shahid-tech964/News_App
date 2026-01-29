class Authevent {}

class SigInEvent extends Authevent {
  final String? email;
  final String? password;
  SigInEvent({required this.email, required this.password});
}

class SigUpEvent extends Authevent {
  final String? email;
  final String? password;
  SigUpEvent({required this.email, required this.password});
}

class SigOutEvent extends Authevent {}
