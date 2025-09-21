part of 'auth_bloc.dart';

enum Status { initial, loading, success, failure }

class AuthState extends Equatable {
  const AuthState({
    this.id = '',
    this.email = '',
    this.password = '',
    this.currentPassword = '',
    this.userName = '',
    this.age = '',
    this.country = '',
    this.status = Status.initial,
    this.loginWithEmail = Status.initial,
    this.newPassword = Status.initial,
    this.otp = '',
  });

  final String id;
  final String email;
  final String password;
  final String currentPassword;
  final String userName;
  final String age;
  final String country;
  final Status status;
  final Status loginWithEmail;
  final Status newPassword;
  final String otp;

  AuthState copyWith({
    String? id,
    String? email,
    String? password,
    String? currentPassword,
    String? userName,
    String? age,
    String? country,
    Status? status,
    Status? loginWithEmail,
    String? otp,
    Status? newPassword,
  }) {
    return AuthState(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      currentPassword: currentPassword ?? this.currentPassword,
      userName: userName ?? this.userName,
      age: age ?? this.age,
      country: country ?? this.country,
      status: status ?? this.status,
      loginWithEmail: loginWithEmail ?? this.loginWithEmail,
      otp: otp ?? this.otp,
      newPassword: newPassword ?? this.newPassword,
    );
  }

  @override
  List<Object> get props => [
    id,
    email,
    password,
    currentPassword,
    userName,
    age,
    country,
    status,
    loginWithEmail,
    otp,
    newPassword,
  ];
}
