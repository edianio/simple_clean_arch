import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class IsarServices {
  late final Future<Isar> isar;

  IsarServices() {
    isar = open();
  }

  Future<Isar> open() async {
    final directory = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return Isar.open(
        [
        ],
        directory: directory.path,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> close() async {}
}