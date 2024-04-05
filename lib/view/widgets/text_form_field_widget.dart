import 'package:barber/constants/app_imports.dart';

class TextFormFieldWidget extends StatelessWidget {
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final void Function(String?)? onSaved;
  final TextInputType? keyboardType;
  final VoidCallback? onClick;
  final String? placeholder;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelName;
  final TextStyle? style;
  final bool? autofocus;
  final double? padding;
  final String? initVal;
  final bool? readOnly;
  final bool? obscure;
  final int? maxLines;
  final Color? color;
  final bool? filled;

  const TextFormFieldWidget({
    this.onFieldSubmitted,
    this.textInputAction,
    this.textController,
    this.keyboardType,
    this.placeholder,
    this.prefixIcon,
    this.suffixIcon,
    this.labelName,
    this.autofocus,
    this.onChanged,
    this.validator,
    this.readOnly,
    this.maxLines,
    this.obscure,
    this.initVal,
    this.padding,
    this.onClick,
    this.onSaved,
    this.filled,
    this.style,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding ?? 15.w,
        ),
        child: TextFormField(
          textInputAction: textInputAction ?? TextInputAction.next,
          textAlignVertical: TextAlignVertical.center,
          cursorColor: color ?? AppColors.petrol,
          onFieldSubmitted: onFieldSubmitted,
          autofocus: autofocus ?? false,
          obscureText: obscure ?? false,
          readOnly: readOnly ?? false,
          controller: textController,
          keyboardType: keyboardType,
          maxLines: maxLines ?? 1,
          initialValue: initVal,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          onTap: onClick,
          minLines: 1,
          style: style ?? AppFonts.fontHeavy18grey.copyWith(color: AppColors.petrol),
          onTapOutside: (PointerDownEvent event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: filled ?? false,
            hintText: placeholder,
            hintStyle: TextStyle(
              color: color ?? AppColors.petrol,
            ),
            labelStyle: TextStyle(
              color: color ?? AppColors.petrol,
            ),
            border: AppDefaults.defaultOutlineInputBorder(25),
            disabledBorder: AppDefaults.defaultOutlineInputBorder(25),
            enabledBorder: AppDefaults.defaultOutlineInputBorder(25),
            focusedBorder: AppDefaults.defaultOutlineInputBorder(25),
            focusedErrorBorder: AppDefaults.defaultOutlineInputBorder(
              25,
              color: AppColors.red,
            ),
            errorBorder: AppDefaults.defaultOutlineInputBorder(
              25,
              color: AppColors.red,
            ),
            errorStyle: TextStyle(
              color: AppColors.red,
            ),
            prefixIconColor: color ?? AppColors.petrol,
            prefixIcon: prefixIcon,
            suffixIconColor: color ?? AppColors.petrol,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
