// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters

class Usuario {
  String _id = '', _cod_tipo = '', _logueo = '', _clave = '';

  Usuario(String id, String cod_tipo, String logueo, String clave) {
    _id = id;
    _cod_tipo = cod_tipo;
    _logueo = logueo;
    _clave = clave;
  }

  Usuario.sinId(String cod_tipo, String logueo, String clave) {
    _cod_tipo = cod_tipo;
    _logueo = logueo;
    _clave = clave;
  }

  Usuario.login(String logueo, String clave) {
    _logueo = logueo;
    _clave = clave;
  }

  String get id {
    return _id;
  }

  set id(String id) {
    _id = id;
  }

  String get cod_tipo {
    return _cod_tipo;
  }

  set cod_tipo(String cod_tipo) {
    _cod_tipo = cod_tipo;
  }

  String get logueo {
    return _logueo;
  }

  set logueo(String logueo) {
    _logueo = logueo;
  }

  String get clave {
    return _clave;
  }

  set clave(String clave) {
    _clave = clave;
  }
}
