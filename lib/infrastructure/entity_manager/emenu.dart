// ignore_for_file: non_constant_identifier_names

import 'package:restauranteflutter/domain/entities/menu.dart';
import 'package:restauranteflutter/infrastructure/controllers/cmenu.dart';

class emenu {
  cmenu ec = cmenu();

  emenu() {
    ec = cmenu();
  }

  Future<Menu> selectMC(String codigo) {
    return ec.selectMC(codigo);
  }

  Future<List<Menu>> selectMCList() {
    return ec.selectMCList();
  }

  Future<List<Menu>> selectMClistToday() {
    return ec.selectMClistToday();
  }

  Future<Menu> insertMC(String cod_comida, int cantidad, double precio) {
    return ec.insertMC(Menu.porDefecto(cod_comida, cantidad, precio));
  }

  Future<Menu> updateMC(String cod_comida, int cantidad, double precio) {
    return ec.updateMC(Menu.porDefecto(cod_comida, cantidad, precio));
  }

  Future<Menu> deleteMC(String id) {
    return ec.deleteMC(id);
  }
}
