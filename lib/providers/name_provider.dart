import 'package:flutter/material.dart';

import '../utility/shared_preference.dart';

class NameProvider with ChangeNotifier {
  Future<String?> getName() async {
    String? name = "";
    name = await UserPreferences().getName();
    //notifyListeners();
    return name;
  }
}
