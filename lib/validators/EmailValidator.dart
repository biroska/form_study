import 'package:form_study/constants/Constants.dart';

class EmailValidator {

  String validateEmail(String value) {

    if (value.isEmpty) {
      return "Campo obrigatório!";
    }

    RegExp regExp = new RegExp(Constants.EMAIL_REGEX);

    if (regExp.hasMatch(value)) {
      return null;
    }

    return 'Email não é válido!';
  }

}
