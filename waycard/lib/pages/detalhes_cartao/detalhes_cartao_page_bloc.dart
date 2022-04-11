import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class DetalhesCartaoPageBloc extends BlocBase {
  StreamController _reloadFaturaController = StreamController.broadcast();

  StreamController _reloadTotalFaturaController = StreamController.broadcast();

  get reloadFaturaStream => _reloadFaturaController.stream;

  get reloadTotalFaturaStream => _reloadTotalFaturaController.stream;

  void reloadFatura() => _reloadFaturaController.sink.add(0);

  void reloadTotalFatura() => _reloadTotalFaturaController.sink.add(0);

  @override
  void dispose() {
    _reloadFaturaController.close();
    _reloadTotalFaturaController.close();
    super.dispose();
  }
}
