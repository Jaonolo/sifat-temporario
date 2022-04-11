import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class SobrePageBloc extends BlocBase {
  StreamController _reloadController = StreamController.broadcast();

  StreamController _downloadController = StreamController.broadcast();

  StreamController _indicatorController = StreamController.broadcast();

  get reloadStream => _reloadController.stream;

  get downloadStream => _downloadController.stream;

  get indicatorStream => _indicatorController.stream;

  void reload() => _reloadController.sink.add(0);

  void changeDownloadState(bool value) => _downloadController.sink.add(value);

  void reloadIndicator() => _indicatorController.sink.add(0);

  @override
  void dispose() {
    _reloadController.close();
    _downloadController.close();
    _indicatorController.close();
    super.dispose();
  }
}
