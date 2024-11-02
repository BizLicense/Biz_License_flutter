import 'package:get/get.dart';

import './ar.dart';
import './en.dart';
import './he.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => <String, Map<String, String>>{
        'en': en,
        'ar': ar,
        'he': he,
      };
}
