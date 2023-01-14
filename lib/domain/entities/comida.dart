// ignore_for_file: unnecessary_getters_setters

class Comida {
  String _id = '', _nombre = '', _ingredientes = '', _imagen = '';

  Comida.vacio();

  Comida(String id, String nombre, String ingredientes, String imagen) {
    _id = id;
    _nombre = nombre;
    _ingredientes = ingredientes;
    _imagen = imagen;
  }

  Comida.sinId(String nombre, String ingredientes, String imagen) {
    _nombre = nombre;
    _ingredientes = ingredientes;
    _imagen = imagen;
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

  String get ingredientes {
    return _ingredientes;
  }

  set ingredientes(String ingredientes) {
    _ingredientes = ingredientes;
  }

  String get imagen {
    return _imagen;
  }

  set imagen(String imagen) {
    _imagen = imagen;
  }
}
