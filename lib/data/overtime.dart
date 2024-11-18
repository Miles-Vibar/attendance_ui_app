import 'package:collection/collection.dart';

import 'current_week.dart';
import 'data_interface.dart';

class Overtime extends DataInterface {
  final String x;
  final int y;

  Overtime({required this.x, required this.y}) : super(x: x, y: y);
}

List<Overtime> get overtimes {
  final values = [56, 23, 67, 87, 23, 98, 30];

  return values
      .mapIndexed((index, value) => Overtime(x: week[index], y: value))
      .toList();
}
