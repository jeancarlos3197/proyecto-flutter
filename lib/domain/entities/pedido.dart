// ignore_for_file: non_constant_identifier_names, unnecessary_getters_setters

enum Estado { pagado, cocinado, terminado }

class Pedido {
  String _id = '', _cod_mozo = '', _nom_cliente = '';
  Estado _estado = Estado.cocinado;
  double _precio_total = 0.0;

  Pedido(String id, String cod_mozo, String nom_cliente, double precio_total,
      Estado estado) {
    _id = id;
    _cod_mozo = cod_mozo;
    _nom_cliente = nom_cliente;
    _precio_total = precio_total;
    _estado = estado;
  }

  Pedido.sinId(
      String cod_mozo, String nom_cliente, double precio_total, Estado estado) {
    _cod_mozo = cod_mozo;
    _nom_cliente = nom_cliente;
    _precio_total = precio_total;
    _estado = estado;
  }

  String get id {
    return _id;
  }

  set id(String id) {
    _id = id;
  }

  String get cod_mozo {
    return _cod_mozo;
  }

  set cod_mozo(String cod_mozo) {
    _cod_mozo = cod_mozo;
  }

  String get nom_cliente {
    return _nom_cliente;
  }

  set nom_cliente(String nom_cliente) {
    _nom_cliente = nom_cliente;
  }

  double get precio_total {
    return _precio_total;
  }

  set precio_total(double precio_total) {
    _precio_total = precio_total;
  }

  Estado get estado {
    return _estado;
  }

  set estado(Estado estado) {
    _estado = estado;
  }
}
