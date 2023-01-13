// ignore_for_file: camel_case_types

import 'package:restauranteflutter/domain/entities/tipo_usuario.dart';
import 'package:restauranteflutter/domain/entities/usuario.dart';
import 'package:restauranteflutter/infrastructure/controllers/conexion.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class cusuario {
  Conexion con = Conexion();
  final supabase = Supabase.instance.client;

  cusuario() {
    con = Conexion();
  }

  Future<TipoUsuario> selectLoginC(Usuario usuario) async {
    var usuQuery = (await supabase
        .from("usuarios")
        .select("cod_tipo")
        .eq("logueo", usuario.logueo)
        .eq("clave", usuario.clave)
        .maybeSingle());

    if (usuQuery == null) {
      return TipoUsuario.sinId("vacio");
    }
    var tuQuery = (await supabase
        .from("tipo_usuarios")
        .select("nombre")
        .eq("id", usuQuery["cod_tipo"])
        .maybeSingle());

    return TipoUsuario.sinId(tuQuery["nombre"]);
  }

  Future<Usuario> selectUC(String codigo) async {
    var query = (await supabase
        .from('usuarios')
        .select('*')
        .eq('id', codigo)
        .maybeSingle());

    return Usuario(
        query['id'], query['cod_tipo'], query['logueo'], query['clave']);
  }

  Future<List<Usuario>> selectUCList() async {
    var listQuery = (await supabase.from("usuarios").select("*"));

    List<Usuario> lista = [];
    for (var i = 0; i < listQuery.length; i++) {
      Usuario usuario = Usuario(listQuery[i]['id'], listQuery[i]['cod_tipo'],
          listQuery[i]['logueo'], listQuery[i]['clave']);
      lista.add(usuario);
    }

    return lista;
  }

  Future<Usuario> insertUC(Usuario usuario) async {
    var newU = (await supabase.from('usuarios').insert({
      'cod_tipo': usuario.cod_tipo,
      'logueo': usuario.logueo,
      'clave': usuario.clave
    }));

    return Usuario(newU['id'], newU['cod_tipo'], newU['logueo'], newU['clave']);
  }

  Future<Usuario> updateUC(Usuario usuario) async {
    var updateU = (await supabase.from('usuarios').update({
      'cod_tipo': usuario.cod_tipo,
      'logueo': usuario.logueo,
      'clave': usuario.clave
    }).match({'id': usuario.id}));

    return Usuario(updateU['id'], updateU['cod_tipo'], updateU['logueo'],
        updateU['clave']);
  }

  Future<Usuario> deleteUC(String codigo) async {
    var deleteU =
        (await supabase.from('usuarios').delete().match({'id': codigo}));

    return Usuario(deleteU['id'], deleteU['cod_tipo'], deleteU['logueo'],
        deleteU['clave']);
  }
}
