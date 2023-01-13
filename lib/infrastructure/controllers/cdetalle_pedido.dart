// ignore_for_file: camel_case_types

import 'package:restauranteflutter/domain/entities/detalle_pedido.dart';
import 'package:restauranteflutter/infrastructure/controllers/conexion.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class cdetalle_pedido {
  Conexion con = Conexion();
  final supabase = Supabase.instance.client;

  cdetalle_pedido() {
    con = Conexion();
  }

  Future<DetallePedido> selectDPC(String codigo) async {
    var query = (await supabase
        .from('detalle_pedidos')
        .select('*')
        .eq('id', codigo)
        .maybeSingle());

    return DetallePedido(query['id'], query['cod_pedido'], query['cod_menu'],
        query['cantidad'], query['precio_unidad'], query['precio_total']);
  }

  Future<List<DetallePedido>> selectDPCList() async {
    var listQuery = (await supabase.from("detalle_pedidos").select("*"));

    List<DetallePedido> lista = [];
    for (var i = 0; i < listQuery.length; i++) {
      DetallePedido detallePedido = DetallePedido(
          listQuery[i]['id'],
          listQuery[i]['cod_pedido'],
          listQuery[i]['cod_menu'],
          listQuery[i]['cantidad'],
          listQuery[i]['precio_unidad'],
          listQuery[i]['precio_total']);
      lista.add(detallePedido);
    }

    return lista;
  }

  Future<DetallePedido> insertDPC(DetallePedido detallePedido) async {
    var newU = (await supabase.from('detalle_pedidos').insert({
      'cod_pedido': detallePedido.cod_pedido,
      'cod_menu': detallePedido.cod_menu,
      'cantidad': detallePedido.cantidad,
      'precio_unidad': detallePedido.precio_unidad,
      'precio_total': detallePedido.precio_total
    }));

    return DetallePedido(newU['id'], newU['cod_pedido'], newU['cod_menu'],
        newU['cantidad'], newU['precio_unidad'], newU['precio_total']);
  }

  Future<DetallePedido> updateDPC(DetallePedido detallePedido) async {
    var updateU = (await supabase.from('detalle_pedidos').update({
      'cod_pedido': detallePedido.cod_pedido,
      'cod_menu': detallePedido.cod_menu,
      'precio_unidad': detallePedido.precio_unidad,
      'precio_total': detallePedido.precio_total
    }).match({'id': detallePedido.id}));

    return DetallePedido(
        updateU['id'],
        updateU['cod_pedido'],
        updateU['cod_menu'],
        updateU['cantidad'],
        updateU['precio_unidad'],
        updateU['precio_total']);
  }

  Future<DetallePedido> deleteDPC(String codigo) async {
    var deleteU =
        (await supabase.from('detalle_pedidos').delete().match({'id': codigo}));

    return DetallePedido(
        deleteU['id'],
        deleteU['cod_pedido'],
        deleteU['cod_menu'],
        deleteU['cantidad'],
        deleteU['precio_unidad'],
        deleteU['precio_total']);
  }
}
