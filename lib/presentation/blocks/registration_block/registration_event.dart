part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object?> get props => [];
}

class UsernameChange extends RegistrationEvent {
  final String username;

  const UsernameChange(this.username);

  @override
  List<Object?> get props => [];
}

class PasswordChange extends RegistrationEvent {
  final String password;

  const PasswordChange(this.password);

  @override
  List<Object?> get props => [];
}
class SubmitRegistration extends RegistrationEvent{}
