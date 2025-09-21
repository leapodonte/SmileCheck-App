part of '../new_password.dart';

class _Body extends StatefulWidget {
  _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final controller = TextEditingController();
  final secondController = TextEditingController();
  var text = '';

  bool check() {
    return controller.text.isNotEmpty &&
        secondController.text.isNotEmpty &&
        controller.text == secondController.text &&
        controller.text.length >= 8;
  }

  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CommonScaffoldScreen(
        child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    'Enter new password',
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
                    title: 'Password',
                    validator: (value) {
                      if (value == null || value.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    hintText: 'Example@email.com',
                  ),
                  Space.yf(40),

                  AppTextField(
                    onChanged: (v) {
                      setState(() {
                        text = v;
                        print(text);
                      });
                    },
                    controller: secondController,
                    title: 'Confirm Password',
                    validator: (value) {
                      if (value == null || value.length < 8) {
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
                  if (state.newPassword == Status.success) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Password Changed')));
                    Navigator.pop(context);
                  } else if (state.newPassword == Status.failure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Something went wrong!')),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.newPassword == Status.loading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return CustomButtonWithCheck(
                    title: 'Continue',
                    check: check(),
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        VerifyCode(password: controller.text),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
