import 'package:flutter/widgets.dart';
import '../objectbox.g.dart';

/**
 * Open and close ObjectBox store access.
 */
class ObjectBoxManager {
  static late Store store;

  static void openObjectBoxStore() async {
      WidgetsFlutterBinding.ensureInitialized();
      store = await openStore();
  }

  static void closeObjectBoxStore() {
      store.close();
  }
}
