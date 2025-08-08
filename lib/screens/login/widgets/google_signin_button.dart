part of '../login_screen.dart';

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
