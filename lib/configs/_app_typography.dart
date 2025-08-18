part of 'configs.dart';

class AppTexts {
  static TextStyle? btn;

  // Headings
  static TextStyle? h1;
  static TextStyle? h1b;
  static TextStyle? h1bm;
  static TextStyle? h2;
  static TextStyle? h2b;
  static TextStyle? h2bm;
  static TextStyle? h3;
  static TextStyle? h3b;
  static TextStyle? h3bm;

  // Body
  static TextStyle? b1;
  static TextStyle? b1b;
  static TextStyle? b1bm;
  static TextStyle? b2;
  static TextStyle? b2b;
  static TextStyle? b2bm;

  // Label
  static TextStyle? l1;
  static TextStyle? l1b;
  static TextStyle? l1bm;
  static TextStyle? l2;
  static TextStyle? l2b;
  static TextStyle? l2bm;
  static TextStyle? l3;
  static TextStyle? l3b;
  static TextStyle? l3bm;

  static init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(414, 896));

    // const b = FontWeight.bold;
    TextStyle baseStyle = TextStyle(
      fontFamily: fontFamily,
      color: AppTheme.c.white!,
    );

    h1 = baseStyle.copyWith(fontSize: 32.h);
    h1b = h1!.copyWith(fontWeight: FontWeight.bold);
    h1bm = h1!.copyWith(fontWeight: FontWeight.w500);

    h2 = baseStyle.copyWith(fontSize: 20.h);
    h2b = h2!.copyWith(fontWeight: FontWeight.w700);
    h2bm = h2!.copyWith(fontWeight: FontWeight.w500);

    h3 = baseStyle.copyWith(fontSize: 18.h);
    h3b = h3!.copyWith(fontWeight: FontWeight.w700);
    h3bm = h3!.copyWith(fontWeight: FontWeight.w500);

    b1 = baseStyle.copyWith(fontSize: 16.h);
    b1b = b1!.copyWith(fontWeight: FontWeight.w600);
    b1bm = b1!.copyWith(fontWeight: FontWeight.w500);

    b2 = baseStyle.copyWith(fontSize: 14.h);
    b2b = b2!.copyWith(fontWeight: FontWeight.w600);
    b2bm = b2!.copyWith(fontWeight: FontWeight.w500);

    TextStyle labelStyle = TextStyle(
      fontFamily: 'Inter',
      color: AppTheme.c.text!,
    );

    l1 = labelStyle.copyWith(fontSize: 16.h);
    l1b = l1!.copyWith(fontWeight: FontWeight.w500);
    l1bm = l1!.copyWith(fontWeight: FontWeight.w400);

    l2 = labelStyle.copyWith(fontSize: 12.h);
    l2b = l2!.copyWith(fontWeight: FontWeight.w600);
    l2bm = l2!.copyWith(fontWeight: FontWeight.w500);

    l3 = labelStyle.copyWith(fontSize: 10.h);
    l3b = l3!.copyWith(fontWeight: FontWeight.w700);
    l3bm = l3!.copyWith(fontWeight: FontWeight.w500);
  }
}
