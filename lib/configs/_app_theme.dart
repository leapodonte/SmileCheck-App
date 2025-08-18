part of 'configs.dart';

class AppTheme {
  static final _core = AppCoreTheme(
    primary: Color(0xff06254B),
    //
    background: Color(0xffC59B36),
    backgroundSub: Color(0xff0B869F), //secondaryT
    fieldLight: Color(0xff34C759),
    fieldDark: Color(0xff777777), // textGreyLarge
    //
    shadow: Color(0x57C59B36),
    shadowSub: Color(0x1AC59B36),
    //
    text: Color(0xffA9A9A9), //
    textLight: Color(0xffA0A0A5), // grey
    lightGrey: Color(0x14000000),
    //
    grey: Color(0xffF8F8FC),
    yellow: Color(0xffFFCC00),
    ghostGrey: Color(0xffE2E8F0),
    //
    white: Color(0xffffffff),
  );

  static AppCoreTheme light = _core;
  static AppCoreTheme dark = _core;

  static late AppCoreTheme c;

  // Init
  static init(BuildContext context) {
    c = isDark(context) ? dark : light;
  }

  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}
