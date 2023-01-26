import 'package:get/get.dart';
import '../../widgets/utils/constantes.dart';

class PagamentosRelatoriosController extends GetxController {


final _planoStatus = Constantes.STATUSNOVO[0].obs;
get planoStatus => _planoStatus.value;
void setPlanoStatus(String value) {
  _planoStatus.value = value;
}

final _planoSelecionado = Constantes.PLANOS[0].obs;
get planoSelecionado => _planoSelecionado.value;
void setPlanoSelecionado(String value) {
  _planoSelecionado.value = value;
}


}