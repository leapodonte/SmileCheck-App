import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:share_plus/share_plus.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_gradients.dart';
import 'package:smilecheck_ai/configs1/app_topology.dart';

part './widgets/chat_textfield.dart';

class AiDentist extends StatefulWidget {
  const AiDentist({super.key});

  @override
  State<AiDentist> createState() => _AiDentistState();
}

class _AiDentistState extends State<AiDentist> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 182.w,
                height: 117.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/teeth.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            23.verticalSpace,
            ResponseCard(
              text:
                  'Thank you! I’ve received your image. Running diagnostic analysis now... ✅ 🦷 Scanning complete. Here’s what I found: Tooth #12: Slight enamel wear detected. No immediate concern, but avoid acidic foods. Tooth #14: Possible early-stage cavity. Recommended to consult a dentist for further evaluation. Tooth #23: Crown detected, condition stable. Overall Dental Score: 78 / 100 Risk Level: Moderate Would you like to view a 3D teeth model or get a clear aligner plan simulation?',
            ),
            ChatTextField(controller: _controller),
          ],
        ),
      ),
    );
  }
}

class ResponseCard extends StatelessWidget {
  const ResponseCard({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 19.r,
                backgroundImage: AssetImage('assets/logo.png'),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(ClipboardData(text: text));
                },
                child: SvgPicture.asset('assets/copy.svg'),
              ),
              8.horizontalSpace,
              GestureDetector(
                onTap: () async {
                  await SharePlus.instance.share(
                    ShareParams(text: text, title: 'Heres you copied text'),
                  );
                },
                child: SvgPicture.asset('assets/share.svg'),
              ),
              // Icon(Icons.share),
            ],
          ),
          8.verticalSpace,
          Text(text, style: AppText.h12),
          8.verticalSpace,
          Row(
            spacing: 10,
            children: [
              ChatYesOrNo(title: 'Yes'),
              ChatYesOrNo(title: 'No'),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatYesOrNo extends StatelessWidget {
  const ChatYesOrNo({super.key, required this.title, this.onTap});
  final VoidCallback? onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 53.w,
        height: 33.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.black,
        ),
        child: Center(
          child: Text(title, style: AppText.h10.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
