// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:restauranteflutter/domain/entities/comida.dart';
import 'package:restauranteflutter/infrastructure/controllers/conexion.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ccomida {
  Conexion con = Conexion();
  final supabase = Supabase.instance.client;

  ccomida() {
    con = Conexion();
  }

  Future<Comida> selectCC(String codigo) async {
    var query = (await supabase
        .from('comidas')
        .select('*')
        .eq('id', codigo)
        .maybeSingle());

    return Comida(
        query['id'], query['nombre'], query['ingredientes'], query['imagen']);
  }

  Future<List<Comida>> selectCCList() async {
    var listQuery = (await supabase.from("comidas").select("*"));

    List<Comida> lista = [];
    for (var i = 0; i < listQuery.length; i++) {
      Comida comida = Comida(listQuery[i]['id'], listQuery[i]['nombre'],
          listQuery[i]['ingredientes'], listQuery[i]['imagen']);
      lista.add(comida);
    }

    return lista;
  }

  Future<Comida?> insertCC(Comida comida) async {
    var newC = (await supabase.from('comidas').insert({
      'nombre': comida.nombre,
      'ingredientes': comida.ingredientes,
      'imagen': comida.imagen
    }));

    debugPrint("update Class $newC");

    return null;
  }

  Future<Comida?> updateCC(Comida comida) async {
    var updateC = await supabase.from('comidas').update({
      'nombre': comida.nombre,
      'ingredientes': comida.ingredientes,
      'imagen': comida.imagen
    }).match({'id': comida.id});

    debugPrint("update Class $updateC");

    return null;
  }

  Future<Comida> deleteCC(String codigo) async {
    var deleteC = (await supabase
        .from('comidas')
        .delete()
        .match({'id': codigo}).maybeSingle());
    debugPrint('delete class $deleteC');

    return Comida(deleteC['id'], deleteC['nombre'], deleteC['ingredientes'],
        deleteC['imagen']);
  }
}
