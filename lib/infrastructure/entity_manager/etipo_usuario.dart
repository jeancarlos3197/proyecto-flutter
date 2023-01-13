// ignore_for_file: camel_case_types

import 'package:restauranteflutter/domain/entities/tipo_usuario.dart';
import 'package:restauranteflutter/infrastructure/controllers/ctipo_usuario.dart';

class etipo_usuario {
  ctipo_usuario ec = ctipo_usuario();

  etipo_usuario() {
    ec = ctipo_usuario();
  }

  Future<TipoUsuario> selectTUE(String codigo) {
    return ec.selectTUC(codigo);
  }

  Future<List<TipoUsuario>> selectTUEList() {
    return ec.selectTUCList();
  }

  Future<TipoUsuario> insertTUE(String nombre) {
    return ec.insertTUC(TipoUsuario.sinId(nombre));
  }

  Future<TipoUsuario> updateTUE(String id, String nombre) {
    return ec.updateTUC(TipoUsuario(id, nombre));
  }

  Future<TipoUsuario> deleteTUE(String id) {
    return ec.deleteTUC(id);
  }
}
