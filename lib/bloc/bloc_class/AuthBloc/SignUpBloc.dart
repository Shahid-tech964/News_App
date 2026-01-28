import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/events/AuthEvents/FirebaseAuthEvent.dart';
import 'package:news_app/bloc/states/AuthStates/FirebaseAuthState.dart';
import 'package:news_app/model/repository/firebaseRepo.dart';


class Signupbloc extends Bloc<SigUpEvent, Firebaseauthstate> {
  final Firebaserepo _firebaserepo = Firebaserepo();
  Signupbloc() : super(InitialState()) {
    on<SigUpEvent>((event, emit) async {
      await _firebaserepo.signUp(event.email ?? "", event.password ?? "");
    });
  }
}