// ignore_for_file: camel_case_types, file_names, avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restauranteflutter/domain/entities/comida.dart';
import 'package:restauranteflutter/domain/entities/menu.dart';
import 'package:restauranteflutter/infrastructure/entity_manager/ecomida.dart';
import 'package:restauranteflutter/infrastructure/entity_manager/emenu.dart';

import 'frmManMenuEdit.dart';

class frmManMenu extends StatefulWidget {
  const frmManMenu({super.key});

  @override
  State<frmManMenu> createState() => _frmManMenuState();
}

class _frmManMenuState extends State<frmManMenu> {
  List<Map<String, dynamic>> items = [];

  ecomida cnComida = ecomida();
  emenu cnMenu = emenu();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadData();
  }

  void _loadData() async {
    List<Map<String, dynamic>> itemsX = [];
    await cnMenu.selectMCList().then(
      (valueMenu) async {
        debugPrint(valueMenu.toString());
        valueMenu.forEach((element) async {
          Map<String, dynamic> item = <String, dynamic>{};
          await cnComida.selectCE(element.cod_comida).then((valueComida) async {
            item.addAll({
              'id': element.id,
              'nombre': valueComida.nombre,
              'cantidad': element.cantidad,
              'precio': element.precio
            });
          });

          itemsX.add(item);
          debugPrint("unidad ${item.toString()}");
          debugPrint("ListadoitemsX ${itemsX.toString()}");
        });

        setState(() {
          items = itemsX;
        });
      },
    );
  }

  void _navigateToOtherPage(BuildContext context, String id) async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => frmManMenuEdit()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Mantenimiento Comida"),
            backgroundColor: Color(0xff6a040f),
          ),
          SliverGrid(
              delegate: SliverChildListDelegate([
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: ListView.builder(
                      itemCount: items.length,
                      itemBuilder: ((context, index) {
                        final itemF = items[index];
                        return InkWell(
                          onTap: () async {
                            debugPrint('Id: ${itemF['nombre']}');
                            _navigateToOtherPage(context, items[index]['id']);
                            setState(() {});
                          },
                          child: Card(
                            // Con esta propiedad modificamos la forma de nuestro card
                            // Aqui utilizo RoundedRectangleBorder para proporcionarle esquinas circulares al Card
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),

                            // Con esta propiedad agregamos margen a nuestro Card
                            // El margen es la separación entre widgets o entre los bordes del widget padre e hijo
                            margin: const EdgeInsets.all(15),

                            // Con esta propiedad agregamos elevación a nuestro card
                            // La sombra que tiene el Card aumentará
                            elevation: 10,

                            // La propiedad child anida un widget en su interior
                            // Usamos columna para ordenar un ListTile y una fila con botones
                            child: Column(
                              children: <Widget>[
                                // Usamos ListTile para ordenar la información del card como titulo, subtitulo e icono
                                ListTile(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(15, 10, 25, 0),
                                  title: Text(items[index]['nombre']),
                                  subtitle: Wrap(children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Cantidad: ${items[index]['cantidad'].toString()}'),
                                        Text(
                                            'Precio: S/.${items[index]['precio'].toString()}')
                                      ],
                                    )
                                  ]),
                                  leading: const Icon(Icons.local_dining),
                                ),

                                // Usamos una fila para ordenar los botones del card
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    TextButton(
                                        onPressed: () => {},
                                        child: const Text('Ver más')),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ))
                  ],
                )
              ]),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                mainAxisSpacing: 50,
                crossAxisSpacing: 300,
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const frmManMenu()));
          setState(() {});
        },
        backgroundColor: const Color(0xff6a040f),
        child: const Icon(Icons.add),
      ),
    );
  }
}
