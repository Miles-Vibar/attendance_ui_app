import 'package:attendance_ui_app/data/data_interface.dart';
import 'package:collection/collection.dart';

import 'current_week.dart';

class TimeIn extends DataInterface {
  final String x;
  final int y;

  TimeIn({required this.x, required this.y}) : super(x: x, y: y);
}

List<TimeIn> get timeIns {
  final values = [50, 53, 65, 60, 73, 67, 30];

  return values
      .mapIndexed((index, value) => TimeIn(x: week[index], y: value))
      .toList();
}
