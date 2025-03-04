import 'dart:math';

String getId() {
  String id = '';
  for (var i = 0; i < 20; i++) {
    id += "${Random().nextInt(9)}";
  }
  return id;
}
