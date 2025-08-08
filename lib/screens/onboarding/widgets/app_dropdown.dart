part of '../onboarding_screen.dart';

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
