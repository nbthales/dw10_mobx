import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  // @observable
  // String _nome = '';
  // String get nome => _nome;

  @readonly
  String _nome = '';

  @readonly
  bool _showSnackbar = false;

  @readonly
  String _mensagemSnackBar = '';

  @action
  void alterarNome(String nome) {
    _nome = nome;
  }

  @action
  Future<void> mostrarSnackBar() async {
    _showSnackbar = false;
    await Future.delayed(Duration.zero);

    _showSnackbar = true;
    _mensagemSnackBar = 'Academia do Flutter abre turmas no dia 15/05';
  }
}
