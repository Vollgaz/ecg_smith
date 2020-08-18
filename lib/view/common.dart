import 'package:flutter/services.dart';

class Common {

  static WhitelistingTextInputFormatter  digitInputFormatter =  WhitelistingTextInputFormatter(RegExp(r'^(\d+)?\.?\d{0,2}'));



}