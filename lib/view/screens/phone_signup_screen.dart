import 'package:barber/constants/app_imports.dart';
import 'package:barber/view/widgets/circle_next_button.dart';
import 'package:barber/view/widgets/phone_auth_field.dart';

class PhoneSignupScreen extends GetWidget<PhoneSignupController> {
  const PhoneSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: AppColors.lightGrey,
            size: 35,
          ),
          backgroundColor: AppColors.petrol,
          elevation: 0,
        ),
        backgroundColor: AppColors.petrol,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification",
                style: AppFonts.fontHeavy18grey,
              ),
              GapWidget(20),
              Text(
                "Fill the form to become our guest",
                style: AppFonts.fontHeavy25White,
              ),
              GapWidget(20),
              phoneAuthField(
                controller: controller.phoneAuthController,
                phoneFormkey: controller.phoneAuthFormKey,
              ),
              GapWidget(80),
              Align(
                alignment: Alignment.bottomCenter,
                child: CircleNextButton(
                  onTap: () {
                    controller.nextButtonPressed();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
