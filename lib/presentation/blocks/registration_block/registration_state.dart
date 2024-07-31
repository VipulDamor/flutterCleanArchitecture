part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final String username;
  final String password;
  final bool isValidUserName;
  final bool isValidPassword;
  final bool isValidForm;

  const RegistrationState(
      {this.username = "",
      this.password = "",
      this.isValidUserName = true,
      this.isValidPassword = true,
      this.isValidForm = false});

  RegistrationState copyWith(
      {String? username,
      String? password,
      bool? isValidUserName,
      bool? isValidPassword,
      bool? isValidForm}) {
    return RegistrationState(
        username: username ?? this.username,
        password: password ?? this.password,
        isValidUserName: isValidUserName ?? this.isValidUserName,
        isValidPassword: isValidPassword ?? this.isValidPassword,
        isValidForm: isValidForm ?? this.isValidForm);
  }

  @override
  List<Object?> get props => [username,password,isValidUserName,isValidPassword,isValidForm];
}
