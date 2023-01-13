// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:restauranteflutter/application/use_cases/frmAdmin.dart';
import 'package:restauranteflutter/application/use_cases/frmCocinero.dart';
import 'package:restauranteflutter/application/use_cases/frmMozo.dart';
import 'package:restauranteflutter/domain/entities/tipo_usuario.dart';
import 'package:restauranteflutter/infrastructure/entity_manager/etipo_usuario.dart';
import 'package:restauranteflutter/infrastructure/entity_manager/eusuario.dart';

class frmLogin extends StatefulWidget {
  const frmLogin({super.key});

  @override
  State<frmLogin> createState() => _frmLogin();
}

class _frmLogin extends State<frmLogin> {
  eusuario cn = eusuario();
  etipo_usuario ifTipoUsuario = etipo_usuario();

  final logueo = TextEditingController();
  final clave = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Inicio de sesión"),
            backgroundColor: Color(0xff6a040f),
          ),
          SliverGrid(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset('assets/user_login.png', width: 150),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: logueo,
                          decoration: InputDecoration(
                            hintText: 'Usuario',
                            icon: const Icon(
                              Icons.person,
                              color: Color(0xfffaa307),
                            ),
                            fillColor: const Color(0xfffaa307),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xfffaa307),
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: TextField(
                          controller: clave,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            icon: const Icon(
                              Icons.lock,
                              color: Color(0xfffaa307),
                            ),
                            fillColor: const Color(0xfffaa307),
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xfffaa307),
                              ),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: (() async {
                            Future<TipoUsuario> rolUsuario =
                                cn.selectLoginE(logueo.text, clave.text);
                            rolUsuario.then(
                              (value) => {
                                if (value.nombre.contains('administrador'))
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const frmAdmin(),
                                    ),
                                  )
                                else if (value.nombre.contains('vacio'))
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            'Error de logueo',
                                            textScaleFactor: 1,
                                          ),
                                          content: const SingleChildScrollView(
                                              child: Text(
                                            'Campos incorrectos',
                                            textScaleFactor: 1,
                                          )),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                logueo.clear();
                                                clave.clear();
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text('Aceptar'),
                                            ),
                                          ],
                                        );
                                      })
                                else if (value.nombre.contains('cocinero'))
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const frmCocinero(),
                                    ),
                                  )
                                else if (value.nombre.contains('mesero'))
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const frmMozo(),
                                    ),
                                  )
                              },
                            );
                          }),
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
                          child: const Text('Login'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
                mainAxisSpacing: 50,
                crossAxisSpacing: 300,
              ))
        ],
      ),
    );
  }
}
