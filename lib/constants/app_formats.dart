import 'package:barber/constants/app_imports.dart';

class AppFormats {
  static String myFormatter(text, replaced) {
    List<String> symbolsToReplace = [
      AppStrings.openingSquareBracketSign,
      AppStrings.closingSquareBracketSign,
      AppStrings.closingParenthesisSign,
      AppStrings.openingParenthesisSign,
      AppStrings.openingCurlyBraceSign,
      AppStrings.closingCurlyBraceSign,
      AppStrings.underscoreSign,
      AppStrings.percentageSign,
      AppStrings.backSlashSign,
      AppStrings.asteriskSign,
      AppStrings.periodSign,
      AppStrings.hyphenSign,
      AppStrings.caretSign,
      AppStrings.commaSign,
      AppStrings.hashSign,
      AppStrings.bangSign,
      AppStrings.andSign,
      AppStrings.atSign,
    ];
    for (String symbol in symbolsToReplace) {
      text = text.replaceAll(symbol, replaced);
    }
    return text.replaceAll(AppStrings.twoSpacesSign, AppStrings.wordsSeparatorSign);
  }

  static String formatPhoneNumber(phoneNumber) {
    String formattedPhoneNumber = phoneNumber.replaceAll(RegExp(r'[^0-9]'), AppStrings.emptySign);
    if (formattedPhoneNumber.length == 11) {
      return AppStrings.plusTwoSign + formattedPhoneNumber.substring(0, 1) + AppStrings.spaceSign + formattedPhoneNumber.substring(1, 4) + AppStrings.spaceSign + formattedPhoneNumber.substring(4, 7) + AppStrings.spaceSign + formattedPhoneNumber.substring(7);
    } else {
      return formattedPhoneNumber;
    }
  }
}
