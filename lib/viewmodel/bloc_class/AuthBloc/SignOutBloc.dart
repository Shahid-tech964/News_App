import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/viewmodel/events/AuthEvents/FirebaseAuthEvent.dart';
import 'package:news_app/viewmodel/states/AuthStates/FirebaseAuthState.dart';
import 'package:news_app/model/repository/firebaseRepo.dart';

class Signoutbloc extends Bloc<Authevent, Firebaseauthstate> {
  final Firebaserepo _firebaserepo = Firebaserepo();
  Signoutbloc() : super(InitialState()) {
    on<SigOutEvent>((event, emit) async {
      await _firebaserepo.signOut();
    });
  }
}
