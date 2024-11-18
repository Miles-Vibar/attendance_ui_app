import 'package:intl/intl.dart';

List<String> get week {
  return List.generate(
    7,
    (i) {
      return DateFormat.MMMd()
          .format(DateTime.now().subtract(Duration(days: i)))
          .toString();
    },
  );
}
