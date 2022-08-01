part of 'utils.imports.dart';

class Utils {
  static void openUrl({required String url, bool? openInExternalBrowser}) async {
    final uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      launchUrl(Uri.parse(url),
          mode: openInExternalBrowser == true ? LaunchMode.externalApplication : LaunchMode.platformDefault);
    }
  }

  static dismissOpenKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  static void callPhone({phone}) async {
    openUrl(url: 'tel:$phone');
  }

  static String addLeadingZero(int val) {
    if (val < 10) {
      return '0$val';
    } else {
      return val.toString();
    }
  }

  static int getColorHexFromStr(String colorStr) {
    colorStr = 'FF' + colorStr;
    colorStr = colorStr.replaceAll('#', '');
    int val = 0;
    int len = colorStr.length;
    for (int i = 0; i < len; i++) {
      int hexDigit = colorStr.codeUnitAt(i);
      if (hexDigit >= 48 && hexDigit <= 57) {
        val += (hexDigit - 48) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 65 && hexDigit <= 70) {
        // A..F
        val += (hexDigit - 55) * (1 << (4 * (len - 1 - i)));
      } else if (hexDigit >= 97 && hexDigit <= 102) {
        // a..f
        val += (hexDigit - 87) * (1 << (4 * (len - 1 - i)));
      } else {
        throw const FormatException('An error occurred when converting a color');
      }
    }
    return val;
  }

  static maskString({required String value, int unmaskedStringLength = 4}) {
    int stringLength = value.length;
    String unmasked = value.substring(stringLength - unmaskedStringLength);
    String masked = '*' * (stringLength - unmaskedStringLength);
    return unmasked + masked;
  }

  static String generateQueryString(List<KeyValuePair> dataArray) {
    String result = '';
    if (dataArray.isNotEmpty) {
      for (KeyValuePair element in dataArray) {
        result += '${element.key}=${element.value}${element != dataArray.last ? "&" : ""}';
      }
    }
    return result;
  }
}
