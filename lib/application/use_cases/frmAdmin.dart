// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class frmAdmin extends StatefulWidget {
  const frmAdmin({super.key});

  @override
  State<frmAdmin> createState() => _frmAdmin();
}

class _frmAdmin extends State<frmAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Secciòn administrador"),
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
                          child: const Text('Mantenimiento usuario'),
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
                          child: const Text('Mantenimiento comida'),
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
                          child: const Text('Mantenimiento menu'),
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
                          child: const Text('Mantenimiento pedido'),
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
