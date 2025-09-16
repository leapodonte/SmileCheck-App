import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/auth_bloc.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_topology.dart';
import 'package:smilecheck_ai/models/country.dart';
import 'package:smilecheck_ai/routes/routes.dart';
import 'package:smilecheck_ai/widgets/app_text_field.dart';
import 'package:smilecheck_ai/widgets/botton_with_check.dart';
import 'package:smilecheck_ai/widgets/common_scaffold_screen.dart';

part './widgets/app_dropdown.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? _selectedAge;
  String? _selectedCountry;
  String? _textfieldText;
  TextEditingController? _controller;

  final List<String> _ageOptions = [
    'Under 18 years old',
    '18–25 years old',
    '26–40 years old',
    '41–60 years old',
    'Over 60 years old',
    'Prefer not to say',
  ];
  @override
  Widget build(BuildContext context) {
    return CommonScaffoldScreen(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state.status == Status.loading) {
              return CircularProgressIndicator();
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Tell us more about yourself.', style: AppText.h5),
                    40.verticalSpace,
                    AppTextField(
                      onChanged: (value) {
                        setState(() {
                          _textfieldText = value;
                        });
                      },
                      controller: _controller,
                      title: 'User name',
                      hintText: 'user123456',
                    ),
                    24.verticalSpace,
                    AppDropDown(
                      onChanged: (value) {
                        setState(() {
                          // widget.selectedValue = value;
                          _selectedAge = value;
                        });
                      },
                      title: 'Age',
                      selectedValue: _selectedAge,
                      hintText: 'Select Age',
                      list: _ageOptions.map((age) {
                        return DropdownMenuItem<String>(
                          value: age,
                          child: Text(
                            age,
                            style: AppText.h2.copyWith(color: Colors.black),
                          ),
                        );
                      }).toList(),
                    ),
                    24.verticalSpace,

                    AppDropDown(
                      onChanged: (value) {
                        setState(() {
                          // widget.selectedValue = value;
                          _selectedCountry = value;
                        });
                      },
                      title: 'Country',
                      selectedValue: _selectedCountry,
                      hintText: 'Select Country',
                      list: countries.map((country) {
                        return DropdownMenuItem<String>(
                          value: country.name,
                          child: Row(
                            children: [
                              // Text(country.flagEmoji, )
                              Text(
                                '${country.flagEmoji}\t${country.name}',
                                style: AppText.h2.copyWith(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),

                CustomButtonWithCheck(
                  title: 'Continue',
                  check:
                      _selectedAge == null ||
                      _selectedCountry == null ||
                      _textfieldText == null,
                  onPressed: () {
                    context.read<AuthBloc>().add(
                      OnboardingEvent(
                        username: _textfieldText!,
                        country: _selectedCountry!,
                        age: _selectedAge!,
                      ),
                    );
                    Navigator.pushNamed(context, AppRoutes.otp);
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
