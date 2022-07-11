
import 'package:skala_mobile/main_commons/main_text_data.dart';

class MainValidatorHelper{
  factory MainValidatorHelper(){
    return _mainValidatorHelper;
  }

  MainValidatorHelper._internal();

  static final MainValidatorHelper _mainValidatorHelper = MainValidatorHelper._internal();

  String validateBasic(String value){
    if (value.isEmpty){
      return MainTextData.textPleaseFillFirst;
    }else{
      return null!;
    }
  }

  String validateNIK(String value) {
    if (value.isEmpty) {
      return MainTextData.textPleaseFillFirst;
    } else {
      const String _pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
      final RegExp _regex = RegExp(_pattern);
      if (!_regex.hasMatch(value)) {
        return MainTextData.textPleaseInputNumber;
      } else if (value.length != 16) {
        return MainTextData.textDescriptionWarningNikLength;
      } else {
        return null!;
      }
    }
  }

  String validatePhoneNumber(String value, {bool isValidate = true}) {
    final String _input = value.replaceAll(' ', '');
    String _output;
    if (_input.isEmpty) {
      return MainTextData.textPleaseFillFirst;
    } else {
      if (_input.length >= 3) {
        if (_input.substring(0, 3) == '+62') {
          _output = _input.replaceRange(0, 3, '0');
        } else if (_input.substring(0, 2) == '62') {
          _output = _input.replaceRange(0, 2, '0');
        } else {
          _output = _input;
        }
        const String _pattern =
            r'(\+62 ((\d{3}([ -]\d{3,})([- ]\d{4,})?)|(\d+)))|(\(\d+\) \d+)|\d{3}( \d+)+|(\d+[ -]\d+)|\d+';
        final RegExp _regex = RegExp(_pattern);
        if (!_regex.hasMatch(_output)) {
          return MainTextData.textInputCorrectPhoneNumberFormat;
        } else {
          if (isValidate) {
            return null!;
          } else {
            return _output;
          }
        }
      }
    }
    return null!;
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return MainTextData.textPleaseFillFirst;
    } else {
      const String _pattern =
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
      final RegExp _regex = RegExp(_pattern);
      if (!_regex.hasMatch(value)) {
        return MainTextData.textInputCorrectEmailFormat;
      } else {
        return null!;
      }
    }
  }
}