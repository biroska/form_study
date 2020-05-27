import 'package:form_study/constants/Constants.dart';

class CamposObrigatoriosValidator {

  String validate(String value ) {

    if ( value.isEmpty ) {
      return " Campo obrigatório!";
    }

    return null;
  }

}
