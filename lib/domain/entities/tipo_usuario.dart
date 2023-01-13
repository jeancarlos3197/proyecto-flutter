// ignore_for_file: unnecessary_getters_setters

class TipoUsuario {
  String _id = '', _nombre = '';
  TipoUsuario(String id, String nombre) {
    _id = id;
    _nombre = nombre;
  }

  TipoUsuario.sinId(String nombre) {
    _nombre = nombre;
  }

  String get id {
    return _id;
  }

  set id(String id) {
    _id = id;
  }

  String get nombre {
    return _nombre;
  }

  set nombre(String nombre) {
    _nombre = nombre;
  }
}
