part of '../opt.dart';

class _Body extends StatefulWidget {
  _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldScreen(
      child: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (s, e) => true,
        listener: (context, state) {
          if (state.status == Status.success) {
            Navigator.pushNamed(context, AppRoutes.start);
          }
        },
        builder: (context, state) {
          if (state.status == Status.loading) {
            return CircularProgressIndicator();
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please check your email',
                    style: AppTexts.h3b!.copyWith(
                      fontSize: 33.h,
                      color: Colors.black,
                    ),
                  ),
                  Space.yf(40),
                  Text(
                    'We’ve sent a code to ',
                    style: AppTexts.h3!.copyWith(color: Colors.black).w(4),
                  ),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      return Text(
                        state.email,
                        style: AppTexts.h3!.copyWith(
                          color: AppTheme.c.backgroundSub,
                        ),
                      );
                    },
                  ),
                  Pinput(
                    length: 6,
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: defaultPinTheme,
                    errorPinTheme: errorPinTheme,

                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: true,
                    onCompleted: (pin) => setState(() {
                      pass = pin;
                    }),
                  ),
                ],
              ),

              CustomButtonWithCheck(
                title: 'Continue',
                check: pass.length != 6,
                onPressed: () {
                  print(pass);
                  context.read<AuthBloc>().add(VerifyCode(otp: pass));
                  print(state.status);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

final defaultPinTheme = PinTheme(
  width: 50.w,
  height: 56.h,
  textStyle: TextStyle(
    fontSize: 20,
    color: Color.fromRGBO(30, 60, 87, 1),
    fontWeight: FontWeight.w600,
  ),
  decoration: BoxDecoration(
    border: Border.all(color: AppTheme.c.fieldDark!),
    borderRadius: BorderRadius.circular(10),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: AppTheme.c.backgroundSub!),
  borderRadius: BorderRadius.circular(8),
);

final errorPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    // border: Border.all(color: Colors.red),
  ),
);
