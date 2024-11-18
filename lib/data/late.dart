import 'package:attendance_ui_app/data/data_interface.dart';
import 'package:collection/collection.dart';

import 'current_week.dart';

class Late extends DataInterface {
  final String x;
  final int y;

  Late({required this.x, required this.y}) : super(x: x, y: y);
}

List<Late> get lates {
  final values = [30, 67, 54, 21, 27, 9, 15];
  return values
      .mapIndexed((index, value) => Late(x: week[index], y: value))
      .toList();
}
