import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(const RegistrationState()) {
    on<UsernameChange>((event, emit) {
      final isUsernameValid = event.username.isNotEmpty;
      emit(state.copyWith(
        username: event.username,
        isValidPassword: isUsernameValid,
        isValidForm: isUsernameValid && state.isValidPassword,
      ));
    });

    on<PasswordChange>((event, emit) {
      final isPasswordValid = event.password.length >= 6;
      emit(state.copyWith(
        password: event.password,
        isValidPassword: isPasswordValid,
        isValidForm: isPasswordValid && state.isValidUserName,
      ));
    });

    on<SubmitRegistration>((event,emit){
      if(state.isValidForm){
        validate(state);
      }
    });

  }

  void validate(RegistrationState state) {
    printToConsole("${state.username} ${state.password}");
  }
}


