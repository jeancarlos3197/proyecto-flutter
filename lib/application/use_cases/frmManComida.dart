// ignore_for_file: camel_case_types, file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restauranteflutter/infrastructure/entity_manager/ecomida.dart';

class frmManComida extends StatefulWidget {
  const frmManComida({super.key});

  @override
  State<frmManComida> createState() => _frmManComidaState();
}

class _frmManComidaState extends State<frmManComida> {
  ecomida cn = ecomida();
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
                      child: FutureBuilder(
                        future: cn.selectCEList(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return ListView.builder(
                              itemCount: snapshot.data?.length,
                              itemBuilder: ((context, index) {
                                return Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
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
                                            placeholder: const AssetImage(
                                                'assets/loading.gif'),
                                            // Como queremos traer una imagen desde un url usamos NetworkImage
                                            image: NetworkImage(
                                                snapshot.data![index].imagen),
                                          ),

                                          // Usamos Container para el contenedor de la descripción
                                          Container(
                                            padding: const EdgeInsets.all(10),
                                            child: Text(
                                                snapshot.data![index].nombre),
                                          ),
                                        ],
                                      ),
                                    ));
                                ;
                              }),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    )
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
        onPressed: () {},
        backgroundColor: const Color(0xff6a040f),
        child: const Icon(Icons.add),
      ),
    );
  }
}
