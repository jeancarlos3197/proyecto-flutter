// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:restauranteflutter/domain/entities/detalle_pedido.dart';
import 'package:restauranteflutter/infrastructure/controllers/cdetalle_pedido.dart';

class edetalle_pedido {
  cdetalle_pedido ec = cdetalle_pedido();

  edetalle_pedido() {
    ec = cdetalle_pedido();
  }

  Future<DetallePedido> selectDPE(String codigo) {
    return ec.selectDPC(codigo);
  }

  Future<List<DetallePedido>> selectDPEList() {
    return ec.selectDPCList();
  }

  Future<DetallePedido> insertDPE(String cod_pedido, String cod_menu,
      int cantidad, double precio_unidad, double precio_total) {
    return ec.insertDPC(DetallePedido.sinId(
        cod_pedido, cod_menu, cantidad, precio_unidad, precio_total));
  }

  Future<DetallePedido> updateDPE(String id, String cod_pedido, String cod_menu,
      int cantidad, double precio_unidad, double precio_total) {
    return ec.updateDPC(DetallePedido(
        id, cod_pedido, cod_menu, cantidad, precio_unidad, precio_total));
  }

  Future<DetallePedido> deleteDPE(String codigo) {
    return ec.deleteDPC(codigo);
  }
}
