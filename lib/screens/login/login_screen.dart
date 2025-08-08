import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';
import 'package:smilecheck_ai/configs/app_gradients.dart';
import 'package:smilecheck_ai/configs/app_topology.dart';
import 'package:smilecheck_ai/routes/routes.dart';
import 'package:smilecheck_ai/widgets/app_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  color: Color(0xFFF7FBFF),
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
                        validator: (value) {
                          if (value == null || value.length < 8) {
                            return 'Password must be at least 8 characters';
                          }
                          return null;
                        },
                        hintText: 'Password',
                      ),
                      SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Forgot Password?',
                            style: AppText.h3.copyWith(
                              color: AppColors.secondaryText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      CustomButton(
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   // Handle login

                          // }
                          Navigator.pushNamed(context, AppRoutes.onboarding);
                        },
                        title: 'Login',
                      ),
                      SizedBox(height: 16),
                      DividerRow(),
                      SizedBox(height: 16),
                      GoogleSignInButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.title});

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Text(title, style: AppText.h4),
    );
  }
}

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () {},
      icon: SvgPicture.asset('assets/googleLogo.svg', height: 20),
      label: Text('Login with Google'),
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 14),
        side: BorderSide(color: Colors.transparent),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
    );
  }
}

class DividerRow extends StatelessWidget {
  const DividerRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(thickness: 1, color: AppColors.iconGrey)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'Or',
            style: AppText.h3.copyWith(color: AppColors.darkGrey),
          ),
        ),
        Expanded(child: Divider(thickness: 1, color: AppColors.iconGrey)),
      ],
    );
  }
}

class UpperStack extends StatelessWidget {
  const UpperStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: .3.sh,
          width: double.infinity,
          decoration: BoxDecoration(gradient: AppGradients.smile50),
          // child: Image.asset('assets/flares.png', fit: BoxFit.cover),
        ),
        SizedBox(
          height: .35.sh,
          width: double.infinity,
          child: Image.asset('assets/flares.png', fit: BoxFit.cover),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('assets/mainLogo.png', height: 44.h)),
              50.verticalSpace,
              Text('Welcome 👋', style: AppText.h1),
              16.verticalSpace,
              Text(
                'Access your personalized dental care anytime, anywhere.',
                style: AppText.h2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
