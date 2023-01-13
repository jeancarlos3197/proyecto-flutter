import 'package:restauranteflutter/domain/entities/pedido.dart';
import 'package:restauranteflutter/infrastructure/controllers/conexion.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class cpedido {
  Conexion con = Conexion();
  final supabase = Supabase.instance.client;

  cpedido() {
    con = Conexion();
  }

  Future<Pedido> selectPC(String codigo) async {
    var query = (await supabase
        .from('pedidos')
        .select('*')
        .eq('id', codigo)
        .maybeSingle());

    return Pedido(query['id'], query['cod_mozo'], query['nom_cliente'],
        query['precio_total'], query['estado']);
  }

  Future<List<Pedido>> selectPCList() async {
    var listQuery = (await supabase.from("pedidos").select("*"));

    List<Pedido> lista = [];
    for (var i = 0; i < listQuery.length; i++) {
      Pedido pedido = Pedido(
          listQuery[i]['id'],
          listQuery[i]['cod_mozo'],
          listQuery[i]['nom_cliente'],
          listQuery[i]['precio_total'],
          listQuery[i]['estado']);
      lista.add(pedido);
    }

    return lista;
  }

  Future<Pedido> insertPC(Pedido pedido) async {
    var newU = (await supabase.from('pedidos').insert({
      'cod_mozo': pedido.cod_mozo,
      'nom_cliente': pedido.nom_cliente,
      'precio_total': pedido.precio_total,
      'estado': pedido.estado
    }));

    return Pedido(newU['id'], newU['cod_mozo'], newU['nom_cliente'],
        newU['precio_total'], newU['estado']);
  }

  Future<Pedido> updatePC(Pedido pedido) async {
    var updateU = (await supabase.from('pedidos').update({
      'cod_mozo': pedido.cod_mozo,
      'nom_cliente': pedido.nom_cliente,
      'precio_total': pedido.precio_total,
      'estado': pedido.estado
    }).match({'id': pedido.id}));

    return Pedido(updateU['id'], updateU['cod_mozo'], updateU['nom_cliente'],
        updateU['precio_total'], updateU['estado']);
  }

  Future<Pedido> deletePC(String codigo) async {
    var deleteU =
        (await supabase.from('pedidos').delete().match({'id': codigo}));

    return Pedido(deleteU['id'], deleteU['cod_mozo'], deleteU['nom_cliente'],
        deleteU['precio_total'], deleteU['estado']);
  }
}
