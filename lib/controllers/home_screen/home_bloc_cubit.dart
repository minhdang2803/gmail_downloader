import 'package:attatchments_downloader/controllers/user/user_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_bloc_state.dart';

class HomeBlocCubit extends Cubit<HomeState> {
  HomeBlocCubit() : super(HomeState.initial());

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "The email field cannot be blank";
    } else if (RegExp(r'^[\w-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
            .hasMatch(value) ==
        true) {
      return "Email format is not correct!";
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "The Password field cannot be blank";
    } else if (RegExp(r"^(?!password)\w$").hasMatch(value) == true) {
      return "Password is not correct!";
    }
    return null;
  }

  void onSubmit(BuildContext context) {
    try {
      if (formKey.currentState?.validate() == true) {
        emit(state.copyWith(state: HomeStatus.loading));
        context.read<UserCubit>().loginByGoogle();
        emit(state.copyWith(state: HomeStatus.success));
      }
    } catch (error) {
      emit(HomeState.initial().copyWith(state: HomeStatus.error));
    }
  }

  void passwordListener() {
    if (passwordController.text.isEmpty) {
      emit(state.copyWith(isPasswordEmpty: true));
    } else {
      emit(state.copyWith(isPasswordEmpty: false));
    }
  }

  void emailListener() {
    if (emailController.text.isEmpty) {
      emit(state.copyWith(isEmailEmpty: true));
    } else {
      emit(state.copyWith(isEmailEmpty: false));
    }
  }
}
