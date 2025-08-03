import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';
import 'package:smilecheck_ai/configs/app_gradients.dart';
import 'package:smilecheck_ai/configs/app_topology.dart';
import 'package:smilecheck_ai/screens/login/login_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String? _selectedAge;

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
    return Scaffold(
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
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Text('Tell us more about yourself.', style: AppText.h5),
              40.verticalSpace,
              AppTextField(title: 'User name', hintText: 'user123456'),
              AppDropDown(
                title: 'Age',
                ageOptions: _ageOptions,
                selectedAge: _selectedAge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppDropDown extends StatefulWidget {
  AppDropDown({
    super.key,
    this.ageOptions = const [],
    this.selectedAge,
    required this.title,
  });
  final List<String> ageOptions;
  String? selectedAge;
  final String title;

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
        DropdownButtonFormField<String>(
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

          hint: Text('Select Age', style: AppText.h3),

          value: widget.selectedAge,
          icon: RotationTransition(
            turns: _iconRotation,
            child: Icon(Icons.keyboard_arrow_down_rounded),
          ),
          items: widget.ageOptions.map((age) {
            return DropdownMenuItem<String>(
              value: age,
              child: Text(age, style: AppText.h2.copyWith(color: Colors.black)),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              widget.selectedAge = value;
            });
          },
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
