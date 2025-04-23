import 'package:athletic/controller/change_theme.dart';
import 'package:athletic/provider/language/ar.dart';
import 'package:athletic/provider/language/en.dart';

String getText(String key) {
  return ChangeProvider.language ? "${en[key]}" : "${ar[key]}";
}
