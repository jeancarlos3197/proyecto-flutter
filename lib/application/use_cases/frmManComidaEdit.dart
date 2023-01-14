// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:restauranteflutter/domain/entities/comida.dart';
import 'package:restauranteflutter/infrastructure/entity_manager/ecomida.dart';

class frmManComidaEdit extends StatefulWidget {
  final String id;

  const frmManComidaEdit({super.key, required this.id});

  @override
  State<frmManComidaEdit> createState() => _frmManComidaEditState();
}

class _frmManComidaEditState extends State<frmManComidaEdit> {
  ecomida cn = ecomida();

  bool _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nombre = TextEditingController();
  final TextEditingController _ingredientes = TextEditingController();
  final TextEditingController _imagen = TextEditingController();

  @override
  void initState() {
    super.initState();

    _fetchData().then((value) {
      setState(() {
        _nombre.text = value.nombre;
        _ingredientes.text = value.ingredientes;
        _imagen.text = value.imagen;
      });
    });
    setState(() {});
  }

  Future<Comida> _fetchData() async {
    return cn.selectCE(widget.id);
  }

  void _updateRpt(String nombre, String ingredientes, String imagen) async {
    String id = widget.id;
    await cn.updateCE(id, nombre, ingredientes, imagen).then((value) {
      debugPrint('Value: $value');

      if (value == null) {
        setState(() {
          _isLoading = false;
        });
      }

      debugPrint('respt: $_isLoading');
    });
  }

  void _deleteRpt() async {
    await cn.deleteCE(widget.id).then((value) => debugPrint('Delete: $value'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Detalle comida"),
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
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Eliminar',
                                            textScaleFactor: 1,
                                          ),
                                          content: const SingleChildScrollView(
                                            child: Text(
                                              'Quiere eliminar este dato',
                                              textScaleFactor: 1,
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Cancelar'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                _deleteRpt();
                                                Navigator.pop(context);
                                              },
                                              child: const Text('Aceptar'),
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: const Text("Eliminar"),
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
                                        setState(() {
                                          _isLoading = true;
                                        });

                                        _updateRpt(_nombre.text,
                                            _ingredientes.text, _imagen.text);

                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                  'Actualizado',
                                                  textScaleFactor: 1,
                                                ),
                                                content:
                                                    const SingleChildScrollView(
                                                  child: Text(
                                                    'Se ha actualizado el dato',
                                                    textScaleFactor: 1,
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child:
                                                        const Text('Aceptar'),
                                                  ),
                                                ],
                                              );
                                            });

                                        /* if (_formKey.currentState!.validate()) {
                                    } */
                                      }),
                                child: _isLoading
                                    ? const CircularProgressIndicator()
                                    : const Text('Actualizar'),
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
