import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import '../models/current_model.dart';

class CurrentProvider extends ChangeNotifier {
  CurrentModel? _current;
  set Current(CurrentModel? CurrentData) {
    _current = CurrentData;
    notifyListeners();
  }

  CurrentModel? get Current => _current;
}
