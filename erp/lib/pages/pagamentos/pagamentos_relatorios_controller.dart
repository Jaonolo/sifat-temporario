import 'package:get/get.dart';
import '../../widgets/utils/constantes.dart';

class PagamentosRelatoriosController extends GetxController {




final _planoSelecionado = Constantes.PLANOS[0].obs;
get planoSelecionado => _planoSelecionado.value;
void setPlanoSelecionado(String value) {
  _planoSelecionado.value = value;
}


}