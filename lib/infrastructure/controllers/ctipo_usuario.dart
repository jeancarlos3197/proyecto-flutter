// ignore_for_file: camel_case_types

import 'package:restauranteflutter/domain/entities/tipo_usuario.dart';
import 'package:restauranteflutter/infrastructure/controllers/conexion.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ctipo_usuario {
  Conexion con = Conexion();
  final supabase = Supabase.instance.client;

  ctipo_usuario() {
    con = Conexion();
  }

  Future<TipoUsuario> selectTUC(String codigo) async {
    var query = (await supabase
        .from('tipo_usuarios')
        .select('*')
        .eq('id', codigo)
        .maybeSingle());

    return TipoUsuario(query['id'], query['nombre']);
  }

  Future<List<TipoUsuario>> selectTUCList() async {
    var listQuery = (await supabase.from("tipo_usuarios").select("*"));

    List<TipoUsuario> lista = [];
    for (var i = 0; i < listQuery.length; i++) {
      TipoUsuario tipoUsuario =
          TipoUsuario(listQuery[i]["id"], listQuery[i]["nombre"]);
      lista.add(tipoUsuario);
    }

    return lista;
  }

  Future<TipoUsuario> insertTUC(TipoUsuario tipoUsuario) async {
    var newTU = (await supabase
        .from('tipo_usuarios')
        .insert({'nombre': tipoUsuario.nombre}));

    return TipoUsuario(newTU['id'], newTU['nombre']);
  }

  Future<TipoUsuario> updateTUC(TipoUsuario tipoUsuario) async {
    var updateTU = (await supabase
        .from('tipo_usuarios')
        .update({'nombre': tipoUsuario.nombre}).match({'id': tipoUsuario.id}));

    return TipoUsuario(updateTU['id'], updateTU['nombre']);
  }

  Future<TipoUsuario> deleteTUC(String codigo) async {
    var deleteTU =
        (await supabase.from('tipo_usuarios').delete().match({'id': codigo}));

    return TipoUsuario(deleteTU['id'], deleteTU['nombre']);
  }
}
