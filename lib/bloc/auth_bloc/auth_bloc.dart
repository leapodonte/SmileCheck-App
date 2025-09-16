import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/data_provider.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<OnSignUpClick>(signUpClick);
    on<OnboardingEvent>(onboarding);
    on<VerifyCode>(verifyCode);
    on<LoginEvent>(loginEvent);
  }

  void signUpClick(OnSignUpClick event, Emitter<AuthState> emit) {
    emit(
      state.copyWith(
        email: event.email,
        password: event.password,
        currentPassword: event.currentPassword,
      ),
    );
  }

  void onboarding(OnboardingEvent event, Emitter<AuthState> emit) async {
    state.copyWith(
      userName: event.username,
      age: event.age,
      country: event.country,
    );

    print(state.email);
    final doc = {
      "email": state.email,
      "password": state.password,
      "confirmPassword": state.currentPassword,
      "name": state.userName,
      "age": state.age,
      "country": state.country,
    };

    emit(state.copyWith(status: Status.loading));
    final respo = await AuthDataProvider.signupUser(doc);
    if (respo['userId'] != null) {
      emit(state.copyWith(id: respo['userId'], status: Status.initial));
    } else {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void verifyCode(VerifyCode event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));

    final doc = {"email": state.email, "code": event.otp};

    final resp = await AuthDataProvider.verifyUser(doc);
    if (resp) {
      await FlutterSecureStorage().write(key: 'id', value: state.id);
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.failure));
    }
  }

  void loginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));

    final doc = {
      "csrfToken":
          "1f73ad31fa7bb4d562e9c2bd1e04f10352020de98c2e0374039d6f03fcab57d9",
      "json": true,
      "email": state.email,
      "callbackUrl": "https://ortho14.eu/signin",
      "password": event.password,
      "redirect": false,
    };

    final resp = await AuthDataProvider.loginUser(event.email, event.password);
    if (resp) {
      await FlutterSecureStorage().write(key: 'id', value: state.id);
      emit(state.copyWith(status: Status.success));
    } else {
      emit(state.copyWith(status: Status.failure));
    }
  }
}
