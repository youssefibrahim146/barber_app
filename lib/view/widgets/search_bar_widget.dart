import 'package:barber/constants/app_imports.dart';

class HomeSearchBarWidget extends StatelessWidget {
  const HomeSearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppFonts.fontLight14grey.copyWith(
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: "Search Here ...",
        prefixIcon: Container(
          margin: EdgeInsets.only(right: 12.sp),
          padding: EdgeInsets.all(14.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.sp),
            color: AppColors.petrol,
          ),
          child: Icon(
            Icons.search,
            color: Colors.black,
            size: 35.sp,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.sp),
          borderSide: BorderSide(
            color: AppColors.lightGrey,
          ),
        ),
      ),
    );
  }
}
