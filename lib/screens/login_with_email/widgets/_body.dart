part of '../login_with_email.dart';

class _Body extends StatefulWidget {
  _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final controller = TextEditingController();
  var text = '';

  bool check() {
    print(EmailValidator.validate(text));
    return EmailValidator.validate(text);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CommonScaffoldScreen(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'Enter your email address',
                  style: AppTexts.h3b!.copyWith(
                    fontSize: 33.h,
                    color: Colors.black,
                  ),
                ),
                Space.yf(40),

                AppTextField(
                  onChanged: (v) {
                    setState(() {
                      text = v;
                      print(text);
                    });
                  },
                  controller: controller,
                  title: 'Email',
                  validator: (value) {
                    if (value == null || !value.contains('@')) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                  hintText: 'Example@email.com',
                ),
              ],
            ),

            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state.loginWithEmail == Status.success) {
                  AppRoutes.otp.pushReplace(context);
                } else if (state.loginWithEmail == Status.failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Failed to send verification code. Please try again.',
                      ),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state.loginWithEmail == Status.loading) {
                  return Center(child: CircularProgressIndicator());
                }
                return CustomButtonWithCheck(
                  title: 'Continue',
                  check: check(),
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      SendVerificationCodeEvent(email: text),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
