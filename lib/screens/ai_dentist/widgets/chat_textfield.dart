part of '../ai_dentist.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required TextEditingController controller,
    this.onTap,
    this.onImageTap,
    this.file,
  }) : _controller = controller;

  final TextEditingController _controller;
  final VoidCallback? onTap;
  final VoidCallback? onImageTap;
  final XFile? file;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        gradient: AppGradients.smileCheckBox, // ✅ Your custom gradient here
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder text
          if (file != null)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              clipBehavior: Clip.hardEdge,
              height: 30.h,
              width: 30.w,
              child: Image.file(File(file!.path)),
            ),
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
                  // backgroundColor: AppColors.yellow,
                  disabledBackgroundColor: Colors.grey,
                  // foregroundColor: AppColors.yellow,
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                ),

                onPressed: onImageTap,
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
                  onPressed: onTap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
