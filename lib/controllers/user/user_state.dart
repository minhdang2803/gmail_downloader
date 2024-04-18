part of 'user_cubit.dart';

enum UserStatus { isloggedIn, unknown }

class UserState extends Equatable {
  late final UserStatus? status;
  late final GoogleSignInAccount? user;

  UserState({
    this.status,
    this.user,
  });
  UserState.initial() {
    status = UserStatus.unknown;
  }

  UserState copyWith({
    UserStatus? status,
    GoogleSignInAccount? user,
  }) {
    return UserState(
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [status];
}
