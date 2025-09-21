import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/auth_bloc.dart';
import 'package:smilecheck_ai/bloc/teeth_bloc/teeth_bloc.dart';
import 'package:smilecheck_ai/configs/configs.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_gradients.dart';
import 'package:smilecheck_ai/configs1/app_topology.dart';
import 'package:smilecheck_ai/routes/routes.dart';
import 'package:smilecheck_ai/widgets/app_text_field.dart';

part 'widgets/upper_stack.dart';
part 'widgets/google_signin_button.dart';
part 'widgets/custom_button.dart';
part 'widgets/divider_row.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check();
  }

  Future<void> check() async {
    final id = await FlutterSecureStorage().read(key: 'email');
    if (id != null) {
      context.read<TeethBloc>().add(GetEmailEvent(id));

      Navigator.pushNamed(context, AppRoutes.start);
    }
  }

  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.buttonBlue,
        extendBodyBehindAppBar: true,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UpperStack(),
            Expanded(
              child: Container(
                color: AppColors.buttonBlue,
                child: Container(
                  // height: .67.sh,
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundBlue,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        /// Email Field
                        AppTextField(
                          title: 'Email',
                          controller: email,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                          hintText: 'Example@email.com',
                        ),
                        24.verticalSpace,

                        /// Password Field
                        AppTextField(
                          title: 'Password',
                          controller: password,
                          validator: (value) {
                            if (value == null || value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                          hintText: 'At least 8 characters',
                        ),
                        SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                              AppRoutes.loginWithEmail.push(context);
                            },
                            child: Text(
                              'Log in with email verification code',
                              style: AppText.h3.copyWith(
                                color: AppColors.secondaryText,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        BlocConsumer<AuthBloc, AuthState>(
                          listener: (context, state) {
                            if (state.status == Status.success) {
                              Navigator.pushNamed(context, AppRoutes.start);
                            }
                          },
                          builder: (context, state) {
                            if (state.status == Status.loading) {
                              return CircularProgressIndicator();
                            }
                            return CustomButton(
                              onPressed: () {
                                // if (_formKey.currentState!.validate()) {
                                //   // Handle login

                                // }
                                // Navigator.pushNamed(context, AppRoutes.onboarding);
                                context.read<AuthBloc>().add(
                                  LoginEvent(
                                    email: email.text,
                                    password: password.text,
                                  ),
                                );
                              },
                              title: 'Login',
                            );
                          },
                        ),
                        SizedBox(height: 16),
                        DividerRow(),
                        SizedBox(height: 16),
                        GoogleSignInButton(),
                        SizedBox(height: 16),
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Dont\'t have an account?',
                              style: AppText.h3.copyWith(
                                color: AppColors.primaryText,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, AppRoutes.signup);
                              },
                              child: Text(
                                'Sign Up',
                                style: AppText.h3.copyWith(
                                  color: AppColors.secondaryText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
