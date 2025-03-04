import 'package:athletic/provider/language/get_text.dart';

String? val(String? p0) {
  if (p0 == null) {
    return getText("field_empty");
  }
  if (p0.isEmpty) {
    return getText("field_empty");
  }
  return null;
}
