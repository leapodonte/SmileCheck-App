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
    return !controller.text.contains('@');
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldScreen(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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

            CustomButtonWithCheck(
              title: 'Continue',
              check: !text.contains('@'),
              onPressed: () {
                AppRoutes.otp.push(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
