// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:restauranteflutter/domain/entities/menu.dart';
import 'package:restauranteflutter/infrastructure/controllers/conexion.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class cmenu {
  Conexion con = Conexion();
  final supabase = Supabase.instance.client;

  cmenu() {
    con = Conexion();
  }

  Future<Menu> selectMC(String codigo) async {
    var query = (await supabase
        .from('menus')
        .select('*')
        .eq('id', codigo)
        .maybeSingle());

    return Menu(query['id'], query['cod_comida'], query['cantidad'],
        query['precio'], query['fecha_actual']);
  }

  Future<List<Menu>> selectMCList() async {
    var listQuery = (await supabase.from("menus").select("*"));

    List<Menu> lista = [];
    for (var i = 0; i < listQuery.length; i++) {
      DateTime date = DateTime.parse(listQuery[i]['fecha_actual']);

      Menu menu = Menu(listQuery[i]['id'], listQuery[i]['cod_comida'],
          listQuery[i]['cantidad'], listQuery[i]['precio'], date);
      lista.add(menu);
    }

    return lista;
  }

  Future<List<Menu>> selectMClistToday() async {
    var listQuery = (await supabase
        .from('menus')
        .select()
        .eq('fecha_actual', DateTime.now()));

    List<Menu> lista = [];
    for (var i = 0; i < listQuery.length; i++) {
      Menu menu = Menu(
          listQuery[i]['id'],
          listQuery[i]['cod_comida'],
          listQuery[i]['cantidad'],
          listQuery[i]['precio'],
          listQuery[i]['fecha_actual']);
      lista.add(menu);
    }

    debugPrint(lista.toString());

    return lista;
  }

  Future<Menu> insertMC(Menu menu) async {
    var newU = (await supabase.from('menus').insert({
      'cod_comida': menu.cod_comida,
      'cantidad': menu.cantidad,
      'precio': menu.precio
    }));

    return Menu(newU['id'], newU['cod_comida'], newU['cantidad'],
        newU['precio'], newU['fecha_actual']);
  }

  Future<Menu> updateMC(Menu menu) async {
    var updateU = (await supabase.from('menus').update({
      'cod_comida': menu.cod_comida,
      'cantidad': menu.cantidad,
      'precio': menu.precio
    }).match({'id': menu.id}));

    return Menu(updateU['id'], updateU['cod_comida'], updateU['cantidad'],
        updateU['precio'], updateU['fecha_actual']);
  }

  Future<Menu> deleteMC(String codigo) async {
    var deleteU = (await supabase.from('menus').delete().match({'id': codigo}));

    return Menu(deleteU['id'], deleteU['cod_comida'], deleteU['cantidad'],
        deleteU['precio'], deleteU['fecha_actual']);
  }
}
