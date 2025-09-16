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
  });

  final String id;
  final String email;
  final String password;
  final String currentPassword;
  final String userName;
  final String age;
  final String country;
  final Status status;

  AuthState copyWith({
    String? id,
    String? email,
    String? password,
    String? currentPassword,
    String? userName,
    String? age,
    String? country,
    Status? status,
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
  ];
}
