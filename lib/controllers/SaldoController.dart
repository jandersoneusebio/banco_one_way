import 'package:http/http.dart' as http;
import 'package:banco_one_way/telas/Main.dart' as main;
import 'package:banco_one_way/constantes.dart';
import 'package:banco_one_way/componentes/InfoConta.dart';


class SaldoController {
  Future<String> atualizarSaldo() async{
    http.Response response = await http.get(url + "conta/consultar-saldo/${agAtual}/${contaAtual}");
    return response.body;
  }
}
