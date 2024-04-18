import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserState.initial());
  final googleSignIn = GoogleSignIn();
  Future<void> loginByGoogle() async {
    final userGoogle = await googleSignIn.signIn();
    if (userGoogle == null) {
      emit(UserState.initial());
    }
    emit(state.copyWith(user: userGoogle));

    final googleAuth = await state.user?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
  }
}
