import 'package:news_app/model/remote/authservice/firebaseauthservice.dart';

class Firebaserepo {
  final Authservice _authservice = Authservice();

  Future<void> signUp(String email, String password) async {
    await _authservice.signUp(email, password);
  }

  Future<void> signIn(String email, String password) async {
    await _authservice.signIn(email, password);
  }

  Future<void> signOut() async {
    await _authservice.signOut();
  }
}
