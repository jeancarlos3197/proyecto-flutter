// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:restauranteflutter/application/use_cases/frmManComidaEdit.dart';
import 'package:restauranteflutter/application/use_cases/frmManComidaNew.dart';
import 'package:restauranteflutter/domain/entities/comida.dart';
import 'package:restauranteflutter/infrastructure/entity_manager/ecomida.dart';

class frmManComida extends StatefulWidget {
  const frmManComida({super.key});

  @override
  State<frmManComida> createState() => _frmManComidaState();
}

class _frmManComidaState extends State<frmManComida> {
  List<Comida> items = [];

  ecomida cn = ecomida();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  void _loadData() async {
    await cn.selectCEList().then((value) {
      setState(() {
        items = value;
      });
    });
  }

  void _navigateToOtherPage(BuildContext context, String id) async {
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => frmManComidaEdit(id: id)));
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
                        return InkWell(
                          onTap: () async {
                            debugPrint('Id: ${items[index].id}');
                            _navigateToOtherPage(context, items[index].id);
                            setState(() {});
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            margin: const EdgeInsets.all(15),
                            elevation: 10,

                            // Dentro de esta propiedad usamos ClipRRect
                            child: ClipRRect(
                              // Los bordes del contenido del card se cortan usando BorderRadius
                              borderRadius: BorderRadius.circular(30),

                              // EL widget hijo que será recortado segun la propiedad anterior
                              child: Column(
                                children: <Widget>[
                                  // Usamos el widget Image para mostrar una imagen
                                  FadeInImage(
                                    placeholder:
                                        const AssetImage('assets/loading.gif'),
                                    // Como queremos traer una imagen desde un url usamos NetworkImage
                                    image: NetworkImage(items[index].imagen),
                                  ),

                                  // Usamos Container para el contenedor de la descripción
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(items[index].nombre),
                                  ),
                                ],
                              ),
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
              MaterialPageRoute(builder: (context) => const frmManComidaNew()));
          setState(() {});
        },
        backgroundColor: const Color(0xff6a040f),
        child: const Icon(Icons.add),
      ),
    );
  }
}
