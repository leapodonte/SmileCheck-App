part of '../signup_screen.dart';

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
              Text('SignUp', style: AppText.h1),
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
