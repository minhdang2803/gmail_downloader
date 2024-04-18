part of 'home_bloc_cubit.dart';

enum HomeStatus { initial, loading, success, error }

class HomeState extends Equatable {
  late final HomeStatus? status;
  late final bool? isEmailEmpty;
  late final bool? isPasswordEmpty;
  HomeState({
    this.status,
    this.isEmailEmpty,
    this.isPasswordEmpty,
  });
  HomeState.initial() {
    status = HomeStatus.initial;
    isEmailEmpty = true;
    isPasswordEmpty = true;
  }

  HomeState copyWith({
    HomeStatus? state,
    bool? isEmailEmpty,
    bool? isPasswordEmpty,
  }) {
    return HomeState(
      status: state ?? this.status,
      isEmailEmpty: isEmailEmpty ?? this.isEmailEmpty,
      isPasswordEmpty: isPasswordEmpty ?? this.isPasswordEmpty,
    );
  }
  
  @override
  // TODO: implement props
  List<Object?> get props => [status,isEmailEmpty,isPasswordEmpty];
}
