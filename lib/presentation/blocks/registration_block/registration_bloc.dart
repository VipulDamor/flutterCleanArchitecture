import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logging/logging.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final log = Logger('RegistrationBloc');

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

    on<SubmitRegistration>((event, emit) {
      emit(state.copyWith(
          isValidForm: state.isValidUserName && state.isValidPassword));
      if (state.isValidForm) {
        _printCredentials(state.username, state.password);
      }
    });
  }

  void _printCredentials(String username, String password) {
    log.info('Username: $username');
    log.info('Password: $password');
  }
}
