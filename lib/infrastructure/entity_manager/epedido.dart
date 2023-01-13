// ignore_for_file: non_constant_identifier_names

import 'package:restauranteflutter/domain/entities/pedido.dart';
import 'package:restauranteflutter/infrastructure/controllers/cpedido.dart';

class epedido {
  cpedido ec = cpedido();

  epedido() {
    ec = cpedido();
  }

  Future<Pedido> selectPE(String codigo) {
    return ec.selectPC(codigo);
  }

  Future<List<Pedido>> selectPEList() {
    return ec.selectPCList();
  }

  Future<Pedido> insertPE(
      String cod_mozo, String nom_cliente, double precio_total, Estado estado) {
    return ec
        .insertPC(Pedido.sinId(cod_mozo, nom_cliente, precio_total, estado));
  }

  Future<Pedido> updatePE(String id, String cod_mozo, String nom_cliente,
      double precio_total, Estado estado) {
    return ec.updatePC(Pedido(id, cod_mozo, nom_cliente, precio_total, estado));
  }

  Future<Pedido> deletePE(String id) {
    return ec.deletePC(id);
  }
}
