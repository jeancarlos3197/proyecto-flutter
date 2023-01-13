// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:restauranteflutter/domain/entities/tipo_usuario.dart';
import 'package:restauranteflutter/domain/entities/usuario.dart';
import 'package:restauranteflutter/infrastructure/controllers/cusuario.dart';

class eusuario {
  cusuario ec = cusuario();
  eusuario() {
    ec = cusuario();
  }

  Future<TipoUsuario> selectLoginE(String logueo, String clave) {
    return ec.selectLoginC(Usuario.login(logueo, clave));
  }

  Future<Usuario> selectUE(String codigo) {
    return ec.selectUC(codigo);
  }

  Future<List<Usuario>> selectUEList() {
    return ec.selectUCList();
  }

  Future<Usuario> insertUE(String cod_tipo, String logueo, String clave) {
    return ec.insertUC(Usuario.sinId(cod_tipo, logueo, clave));
  }

  Future<Usuario> updateUE(
      String id, String cod_tipo, String logueo, String clave) {
    return ec.updateUC(Usuario(id, cod_tipo, logueo, clave));
  }

  Future<Usuario> deleteUE(String codigo) {
    return ec.deleteUC(codigo);
  }
}
