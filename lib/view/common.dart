import 'package:flutter/services.dart';

class Common {
  static FilteringTextInputFormatter digitInputFormatter = FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'));
}
