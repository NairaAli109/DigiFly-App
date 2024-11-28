import 'package:digifly_task/core/localization/arabic_translation.dart';
import 'package:digifly_task/core/localization/english_translation.dart';
import 'package:get/get.dart';

class AppTranslation extends Translations {

  final Map<String, String> en = english;
  final Map<String, String> ar = arabic;

  @override
  Map<String, Map<String, String>> get keys => {'en': en, 'ar': ar};
}
