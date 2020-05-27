class Constants {

  static const String EMAIL_REGEX = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                                    "\\@" +
                                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                                    "(" +
                                    "\\." +
                                    "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                                    ")+";
}