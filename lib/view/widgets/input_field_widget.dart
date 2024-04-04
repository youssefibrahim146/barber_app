import 'package:barber/constants/app_imports.dart';

class InputFieldWidget extends StatelessWidget {
  final bool? obscure;
  final int? maxLines;
  final bool? readOnly;
  final bool? autofocus;
  final String? initVal;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? placeholder;
  final TextAlign? textAlign;
  final VoidCallback? onClick;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final void Function(String)? onFieldSubmitted;

  const InputFieldWidget({
    super.key,
    this.onFieldSubmitted,
    this.textInputAction,
    this.textController,
    this.keyboardType,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.textAlign,
    this.autofocus,
    this.onChanged,
    this.validator,
    this.readOnly,
    this.maxLines,
    this.obscure,
    this.initVal,
    this.onClick,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5.h,
      ),
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscure ?? false,
        textAlign: textAlign ?? TextAlign.center,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction ?? TextInputAction.next,
        textAlignVertical: TextAlignVertical.center,
        minLines: 1,
        maxLines: maxLines ?? 1,
        controller: textController,
        autofocus: autofocus ?? false,
        onTap: onClick,
        readOnly: readOnly ?? false,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,
        initialValue: initVal,
        cursorColor: AppColors.petrol,
        onTapOutside: (PointerDownEvent event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: AppFonts.fontHeavy20Petrol,
          fillColor: AppColors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.sp),
            borderSide: const BorderSide(
              color: AppColors.transparent,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.sp),
            borderSide: const BorderSide(
              color: AppColors.transparent,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.sp),
            borderSide: const BorderSide(
              color: AppColors.transparent,
            ),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.sp),
            borderSide: const BorderSide(
              color: AppColors.transparent,
            ),
          ),
        ),
        style: AppFonts.fontHeavy20Petrol,
      ),
    );
  }
}
