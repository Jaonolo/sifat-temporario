import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class HomePageBloc extends BlocBase {
  StreamController _reloadController = StreamController.broadcast();

  get reloadStream => _reloadController.stream;

  void reload() => _reloadController.sink.add(0);

  @override
  void dispose() {
    _reloadController.close();
    super.dispose();
  }
}
