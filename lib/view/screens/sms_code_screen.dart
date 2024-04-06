import 'package:barber/constants/app_imports.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SMSCodeScreen extends GetWidget<SMSCodeController> {
  const SMSCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String phoneNumber = Get.arguments;
    return Scaffold(
      backgroundColor: AppColors.petrol,
      appBar: AppBar(
        backgroundColor: AppColors.petrol,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.white,
            size: 30,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "We sent you an SMS code",
            style: AppFonts.fontHeavy25White,
          ),
          Text(
            "On Number: +20 " + controller.formatPhoneNumber(phoneNumber),
            style: AppFonts.fontHeavy16White,
          ),
          GapWidget(50),
          Padding(
            padding: const EdgeInsets.all(15),
            child: PinCodeTextField(
              appContext: context,
              autoFocus: true,
              enablePinAutofill: true,
              cursorColor: AppColors.white,
              keyboardType: TextInputType.number,
              length: 6,
              obscureText: false,
              enableActiveFill: true,
              animationType: AnimationType.scale,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 40,
                disabledColor: AppColors.white,
                activeColor: AppColors.Grey,
                inactiveColor: AppColors.Grey,
                selectedColor: AppColors.lightGrey,

                /// fill color
                activeFillColor: AppColors.Grey,
                inactiveFillColor: AppColors.white,
                selectedFillColor: AppColors.white,
              ),
              onCompleted: (otp) {
                controller.signInWithPhoneNumber(
                  otp,
                  controller.verificationId,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
