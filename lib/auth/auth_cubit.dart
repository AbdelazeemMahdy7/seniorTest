import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());

  var firebaseAuth = FirebaseAuth.instance;

  void createAccount({
    required String email,
    required String password,
  }) {
    firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
        .then((value) =>emit(RegisterSuccessState()))
        .catchError((error)=>emit(RegisterFailureState(error.toString())));
  }
}
