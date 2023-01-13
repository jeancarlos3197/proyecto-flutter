import 'package:restauranteflutter/domain/entities/comida.dart';
import 'package:restauranteflutter/infrastructure/controllers/ccomida.dart';

class ecomida {
  ccomida ec = ccomida();

  ecomida() {
    ec = ccomida();
  }

  Future<Comida> selectCE(String codigo) {
    return ec.selectCC(codigo);
  }

  Future<List<Comida>> selectCEList() {
    return ec.selectCCList();
  }

  Future<Comida> insertCE(String nombre, String ingredientes, String imagen) {
    return ec.insertCC(Comida.sinId(nombre, ingredientes, imagen));
  }

  Future<Comida> updateCE(
      String id, String nombre, String ingredientes, String imagen) {
    return ec.updateCC(Comida(id, nombre, ingredientes, imagen));
  }

  Future<Comida> deleteCE(String id) {
    return ec.deleteCC(id);
  }
}
