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
      child: Column(
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
              Text(
                'helloworld@gmail.com ',
                style: AppTexts.h3!.copyWith(color: AppTheme.c.backgroundSub),
              ),
              Pinput(
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: defaultPinTheme,
                errorPinTheme: errorPinTheme,
                validator: (s) {
                  return s == '2222' ? null : 'Pin is incorrect';
                },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) => setState(() {
                  pass = pin;
                }),
              ),

              // AppTextField(
              //   title: 'Email',
              //   validator: (value) {
              //     if (value == null || value.length < 8) {
              //       return 'Password must be at least 8 characters';
              //     }
              //     return null;
              //   },
              //   hintText: 'Example@email.com',
              // ),
            ],
          ),

          CustomButtonWithCheck(
            title: 'Continue',
            check: pass != '2222',
            onPressed: () {},
          ),
        ],
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
