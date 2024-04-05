import 'package:barber/constants/app_imports.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final Color? placeholderColor;
  final String imageUrl;

  const CachedNetworkImageWidget({
    this.borderRadius,
    this.placeholderColor,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(13.sp),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        filterQuality: FilterQuality.high,
        fit: BoxFit.cover,
        errorWidget: (BuildContext context, String object, Object stackTrace) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.sp),
            ),
            child: SizedBox(
              width: 325.w,
              child: Icon(
                Icons.error_outline_rounded,
                color: placeholderColor ?? AppColors.petrol,
                size: 50.sp,
              ),
            ),
          );
        },
        placeholder: (BuildContext context, String url) {
          return SizedBox(
            height: 100.sp,
            width: 100.sp,
            child: Center(
              child: CircularProgressIndicator(
                color: placeholderColor ?? AppColors.petrol,
              ),
            ),
          );
        },
      ),
    );
  }
}
