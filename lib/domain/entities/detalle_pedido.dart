// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters

class DetallePedido {
  String _id = '', _cod_pedido = '', _cod_menu = '';
  int _cantidad = 0;
  double _precio_unidad = 0.0, _precio_total = 0.0;

  DetallePedido(String id, String cod_pedido, String cod_menu, int cantidad,
      double precio_unidad, double precio_total) {
    _id = id;
    _cod_pedido = cod_pedido;
    _cod_menu = cod_menu;
    _precio_total = precio_total;
    _precio_unidad = precio_unidad;
    _cantidad = cantidad;
  }

  DetallePedido.sinId(String cod_pedido, String cod_menu, int cantidad,
      double precio_unidad, double precio_total) {
    _cod_pedido = cod_pedido;
    _cod_menu = cod_menu;
    _precio_total = precio_total;
    _precio_unidad = precio_unidad;
    _cantidad = cantidad;
  }

  String get id {
    return _id;
  }

  set id(String id) {
    _id = id;
  }

  String get cod_pedido {
    return _cod_pedido;
  }

  set cod_pedido(String cod_pedido) {
    _cod_pedido = cod_pedido;
  }

  String get cod_menu {
    return _cod_menu;
  }

  set cod_menu(String cod_menu) {
    _cod_menu = cod_menu;
  }

  int get cantidad {
    return _cantidad;
  }

  set cantidad(int cantidad) {
    _cantidad = cantidad;
  }

  double get precio_unidad {
    return _precio_unidad;
  }

  set precio_unidad(double precio_unidad) {
    _precio_unidad = precio_unidad;
  }

  double get precio_total {
    return _precio_total;
  }

  set precio_total(double precio_total) {
    _precio_total = precio_total;
  }
}
