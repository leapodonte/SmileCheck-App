import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smilecheck_ai/configs/app_colors.dart';
import 'package:smilecheck_ai/configs/app_gradients.dart';
import 'package:smilecheck_ai/configs/app_topology.dart';

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
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                gradient:
                    AppGradients.smileCheckBox, // ✅ Your custom gradient here
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Placeholder text
                  TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      hintText: 'Write now...',
                      hintStyle: AppText.h11,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Row with buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Add Images Button
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.textGreyLarge,
                          shape: StadiumBorder(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 10.h,
                          ),
                        ),
                        onPressed: () {
                          // Handle image adding
                        },
                        icon: Icon(
                          Icons.image_outlined,
                          size: 24.sp,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Add images',
                          style: AppText.h8.copyWith(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),

                      // Send Button
                      Container(
                        width: 44.w,
                        height: 44.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.buttonBlue, // Customize if needed
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.arrow_upward_rounded,
                            size: 24.sp,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            // Handle send
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
