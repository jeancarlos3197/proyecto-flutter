// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters

class Menu {
  String _id = '', _cod_comida = '';
  int _cantidad = 0;
  double _precio = 0.0;
  DateTime _fecha_actual = DateTime.now();

  Menu(String id, String cod_comida, int cantidad, double precio,
      DateTime fecha_actual) {
    _id = id;
    _cod_comida = cod_comida;
    _cantidad = cantidad;
    _precio = precio;
    _fecha_actual = fecha_actual;
  }

  Menu.sinId(
      String cod_comida, int cantidad, double precio, DateTime fecha_actual) {
    _cod_comida = cod_comida;
    _cantidad = cantidad;
    _precio = precio;
    _fecha_actual = fecha_actual;
  }

  Menu.porDefecto(String cod_comida, int cantidad, double precio) {
    _cod_comida = cod_comida;
    _cantidad = cantidad;
    _precio = precio;
  }

  String get id {
    return _id;
  }

  set id(String id) {
    _id = id;
  }

  String get cod_comida {
    return _cod_comida;
  }

  set cod_comida(String cod_comida) {
    _cod_comida = cod_comida;
  }

  int get cantidad {
    return _cantidad;
  }

  set cantidad(int cantidad) {
    _cantidad = cantidad;
  }

  double get precio {
    return _precio;
  }

  set precio(double precio) {
    _precio = precio;
  }

  DateTime get fecha_actual {
    return _fecha_actual;
  }

  set fecha_actual(DateTime fecha_actual) {
    _fecha_actual = fecha_actual;
  }
}
