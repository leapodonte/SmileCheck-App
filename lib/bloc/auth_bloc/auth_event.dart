part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

class OnSignUpClick extends AuthEvent {
  final String email;
  final String password;
  final String currentPassword;
  const OnSignUpClick({
    required this.email,
    required this.password,
    required this.currentPassword,
  });

  @override
  List<Object?> get props => [email, password, currentPassword];
}

class OnboardingEvent extends AuthEvent {
  final String username;
  final String age;
  final String country;
  const OnboardingEvent({
    required this.username,
    required this.country,
    required this.age,
  });

  @override
  List<Object?> get props => [username, country, age];
}

class VerifyCode extends AuthEvent {
  final String password;

  const VerifyCode({required this.password});

  @override
  List<Object?> get props => [password];
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class SendVerificationCodeEvent extends AuthEvent {
  final String email;

  const SendVerificationCodeEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
