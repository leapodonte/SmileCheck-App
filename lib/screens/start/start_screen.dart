import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smilecheck_ai/bloc/auth_bloc/auth_bloc.dart';
import 'package:smilecheck_ai/bloc/teeth_bloc/teeth_bloc.dart';
import 'package:smilecheck_ai/configs1/app_colors.dart';
import 'package:smilecheck_ai/configs1/app_topology.dart';
import 'package:smilecheck_ai/models/tooth.dart';
import 'package:smilecheck_ai/routes/routes.dart';
import 'package:smilecheck_ai/widgets/botton_with_check.dart';
import 'package:smilecheck_ai/widgets/common_scaffold_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  XFile? file;
  @override
  Widget build(BuildContext context) {
    return CommonScaffoldScreen(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Upload a Frontal View', style: AppText.h6),
              Text(
                'Smile with teeth fully visible, looking straight at the camera.',
                textAlign: TextAlign.center,
                style: AppText.h6.copyWith(
                  color: AppColors.textFieldGrey,
                  fontSize: 18.sp,
                ),
              ),
              30.verticalSpace,
              Container(
                height: 257.h,
                width: 257.w,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    width: 4,
                    color: file != null
                        ? AppColors.buttonBlue
                        : AppColors.iconGrey,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(36),
                  child: file != null
                      ? Image.file(File(file!.path), fit: BoxFit.cover)
                      : Image.asset('assets/profile.png', fit: BoxFit.cover),
                ),
              ),
              30.verticalSpace,
              ButtonForMedia(
                icon: Icons.camera_alt_outlined,
                title: 'Take Photo',
                onTap: () async {
                  file = await ImagePicker().pickImage(
                    source: ImageSource.camera,
                  );
                  setState(() {});
                },
              ),
              12.verticalSpace,
              ButtonForMedia(
                icon: Icons.drive_folder_upload_outlined,
                title: 'Upload Photo',
                onTap: () async {
                  file = await ImagePicker().pickImage(
                    source: ImageSource.gallery,
                  );
                  setState(() {});
                },
              ),
            ],
          ),
          BlocConsumer<TeethBloc, TeethState>(
            listener: (context, state) {
              if (state.status == Status.success) {
                // Navigator.pushNamed(context, AppRoutes.dashboardBackground);
              }
            },
            builder: (context, state) {
              if (state.status == Status.loading) {
                return CircularProgressIndicator();
              }
              return CustomButtonWithCheck(
                title: 'CONTINUE',
                check: file == null,
                onPressed: () {
                  context.read<TeethBloc>().add(
                    PictureUploadEvent(file: file!),
                  );
                  Navigator.pushNamed(context, AppRoutes.dashboardBackground);

                  // Navigator.pushNamed(context, AppRoutes.dashboardBackground);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

final List<Tooth> topTeeth = [
  Tooth(label: '85'),
  Tooth(label: '85'),
  Tooth(label: '80'),
  Tooth(label: '60', isHighlighted: true),
  Tooth(label: '78'),
  Tooth(label: '85'),
  Tooth(label: '78'),
  Tooth(label: '85'),
  Tooth(label: '60', isHighlighted: true),
  Tooth(label: '85'),
  Tooth(label: '85'),
];

final List<Tooth> bottomTeeth = [
  Tooth(label: '85'),
  Tooth(label: '85'),
  Tooth(label: '80'),
  Tooth(label: '60', isHighlighted: true),
  Tooth(label: '78'),
  Tooth(label: '80'),
  Tooth(label: '78'),
  Tooth(label: '60', isHighlighted: true),
  Tooth(label: '85'),
  Tooth(label: '85'),
];

class ToothWidget extends StatelessWidget {
  final Tooth tooth;

  const ToothWidget(this.tooth, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.all(4),
      width: 25,
      // height: 40,
      decoration: BoxDecoration(
        // color: tooth.isHighlighted ? Colors.orange : Colors.grey.shade400,
        borderRadius: BorderRadius.circular(6),
      ),
      alignment: Alignment.center,
      child: SvgPicture.asset(
        'assets/tooth.svg',
        color: tooth.isHighlighted ? Colors.orange : Colors.grey.shade400,
      ),
    );
  }
}

class ButtonForMedia extends StatelessWidget {
  const ButtonForMedia({
    super.key,
    required this.icon,
    required this.onTap,
    required this.title,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 47.h,
        width: 180.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),

          border: Border.all(color: AppColors.iconGrey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: AppColors.grey),
            10.horizontalSpace,
            Text(title, style: AppText.h7),
          ],
        ),
      ),
    );
  }
}
