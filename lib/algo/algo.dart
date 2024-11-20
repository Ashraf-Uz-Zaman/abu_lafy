import 'package:abu_lafy/application/functions.dart';

String removeFirstLetter(String text){
      if(isPhoneStartWithZero(text)) {
        return "+966${text.substring(1)}";
      }
      else {
        return text;
      }
}