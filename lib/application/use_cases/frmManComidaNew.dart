// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:restauranteflutter/domain/entities/comida.dart';
import 'package:restauranteflutter/infrastructure/entity_manager/ecomida.dart';

class frmManComidaNew extends StatefulWidget {
  const frmManComidaNew({super.key});

  @override
  State<frmManComidaNew> createState() => _frmManComidaNewState();
}

class _frmManComidaNewState extends State<frmManComidaNew> {
  ecomida cn = ecomida();
  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _ingredientes = TextEditingController();
  final TextEditingController _imagen = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Registrar datos"),
            backgroundColor: Color(0xff6a040f),
          ),
          SliverGrid(
            delegate: SliverChildListDelegate([
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.center,
                          child: TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Nombre'),
                            textAlign: TextAlign.center,
                            controller: _nombre,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.center,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxHeight: 150.0),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: 'Ingredientes'),
                              maxLines: null,
                              expands: true,
                              textAlign: TextAlign.center,
                              controller: _ingredientes,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          alignment: Alignment.center,
                          child: TextFormField(
                            decoration: const InputDecoration(
                                hintText: 'URL de la imagen'),
                            textAlign: TextAlign.center,
                            controller: _imagen,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancelar"),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff6a040f),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: _isLoading
                                    ? null
                                    : (() async {
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            _isLoading = true;
                                          });

                                          await cn
                                              .insertCE(
                                                  _nombre.text,
                                                  _ingredientes.text,
                                                  _imagen.text)
                                              .then((value) => {
                                                    showDialog(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return AlertDialog(
                                                            title: const Text(
                                                              'Registrado',
                                                              textScaleFactor:
                                                                  1,
                                                            ),
                                                            content:
                                                                const SingleChildScrollView(
                                                              child: Text(
                                                                'Se ha actualizado el dato',
                                                                textScaleFactor:
                                                                    1,
                                                              ),
                                                            ),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: const Text(
                                                                    'Aceptar'),
                                                              ),
                                                            ],
                                                          );
                                                        })
                                                  });
                                        }
                                      }),
                                child: _isLoading
                                    ? const CircularProgressIndicator()
                                    : const Text('Login'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ]),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 500,
              mainAxisSpacing: 50,
              crossAxisSpacing: 300,
            ),
          )
        ],
      ),
    );
  }
}
