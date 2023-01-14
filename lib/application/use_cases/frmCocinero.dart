// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:restauranteflutter/application/use_cases/frmManComida.dart';
import 'package:restauranteflutter/application/use_cases/frmManMenu.dart';

class frmCocinero extends StatefulWidget {
  const frmCocinero({super.key});

  @override
  State<frmCocinero> createState() => _frmCocinero();
}

class _frmCocinero extends State<frmCocinero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Sección Cocinero"),
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
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const frmManComida(),
                              ),
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
                          child: const Text('Mantenimiento comidas'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: (() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const frmManMenu(),
                              ),
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
                          child: const Text('Mantenimiento menús'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: (() {
                            debugPrint("Onclick");
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
                          child: const Text('Ver pedidos'),
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
