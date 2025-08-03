import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';
import 'package:smilecheck_ai/configs/app_topology.dart';
import 'package:smilecheck_ai/routes/routes.dart';
import 'package:smilecheck_ai/screens/login/login_screen.dart';

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
      child: Column(
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

          CustomButton(
            title: 'Continue',
            check:
                _selectedAge == null ||
                _selectedCountry == null ||
                _textfieldText == null,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.start);
            },
          ),
        ],
      ),
    );
  }
}

class CommonScaffoldScreen extends StatelessWidget {
  const CommonScaffoldScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 60,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            maxRadius: 6,
            backgroundColor: AppColors.grey,
            child: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 15,
            ),
          ),
        ),
        title: Image.asset('assets/mainLogo.png', height: 44.h),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [.1, 5],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.white,
              AppColors.buttonBlue.withValues(alpha: .5),
            ],
          ),
        ),
        child: Padding(padding: const EdgeInsets.all(40.0), child: child),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.check,
  });

  final VoidCallback? onPressed;
  final String title;
  final bool check;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: check ? AppColors.grey : AppColors.buttonBlue,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      ),
      child: Text(title, style: AppText.h4.copyWith(color: Colors.white)),
    );
  }
}

class AppDropDown extends StatefulWidget {
  AppDropDown({
    super.key,
    this.selectedValue,
    required this.title,
    required this.list,
    this.hintText = '',
    this.onChanged,
  });
  String? selectedValue;
  String hintText;
  final String title;
  final List<DropdownMenuItem> list;
  final ValueChanged? onChanged;

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNode = FocusNode();
  late AnimationController _animationController;
  late Animation<double> _iconRotation;
  bool _isDropdownOpen = false;

  @override
  void initState() {
    super.initState();

    // Animation setup
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );

    _iconRotation = Tween<double>(begin: 0, end: 0.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _focusNode.addListener(() {
      setState(() {
        _isDropdownOpen = _focusNode.hasFocus;
        if (_isDropdownOpen) {
          _animationController.forward(); // rotate arrow up
        } else {
          _animationController.reverse(); // rotate arrow down
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppText.h3.copyWith(color: AppColors.primaryText),
        ),
        SizedBox(height: 8),
        DropdownButtonFormField(
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              // vertical: 5,
              horizontal: 15,
            ),
            filled: true,
            fillColor: Colors.white,
            // // hintText: hintText,
            // hintStyle: AppText.h3,
            // // labelStyle: AppText.h3,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textFieldBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textFieldBorder),
            ),
            // errorBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(12),
            //   borderSide: BorderSide(color: Colors.red),
            // ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: AppColors.textFieldBorder),
            ),
          ),

          hint: Text(widget.hintText, style: AppText.h3),

          value: widget.selectedValue,
          icon: RotationTransition(
            turns: _iconRotation,
            child: Icon(Icons.keyboard_arrow_down_rounded),
          ),
          items: widget.list,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}

class Country {
  final String name;
  final String flagEmoji;

  Country({required this.name, required this.flagEmoji});
}

final List<Country> countries = [
  Country(name: 'China', flagEmoji: '🇨🇳'),
  Country(name: 'United States', flagEmoji: '🇺🇸'),
  Country(name: 'France', flagEmoji: '🇫🇷'),
  Country(name: 'Japan', flagEmoji: '🇯🇵'),
  Country(name: 'United Kingdom', flagEmoji: '🇬🇧'),
  Country(name: 'Germany', flagEmoji: '🇩🇪'),
];
