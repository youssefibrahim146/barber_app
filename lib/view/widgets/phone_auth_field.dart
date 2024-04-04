import '../../constants/app_imports.dart';

class phoneAuthField extends StatelessWidget {
  final GlobalKey<FormState> phoneFormkey;
  final TextEditingController controller;

  const phoneAuthField(
      {super.key, required this.controller, required this.phoneFormkey});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: phoneFormkey,
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return AppStrings.phoneNumberEmptyValidate;
          } else if (value.length < 10 || value.length > 11) {
            return AppStrings.badlyFormattedPhoneNumberValidate;
          }
        },
        controller: controller,
        keyboardType: TextInputType.phone,
        style: AppFonts.fontHeavy17black.copyWith(
          fontSize: 25,
        ),
        decoration: InputDecoration(
          prefixIcon: SizedBox(
            width: 65,
            height: 30,
            child: Center(
              child: Text(
                "+20",
                style: AppFonts.fontHeavy17black.copyWith(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          hintText: "000 000 0000",
          hintStyle: AppFonts.fontLight14grey.copyWith(
            fontSize: 25,
          ),
          fillColor: AppColors.Grey,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColors.Grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColors.Grey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColors.Grey,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColors.Grey,
            ),
          ),
        ),
      ),
    );
  }
}
