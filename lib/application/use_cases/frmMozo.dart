// ignore_for_file: camel_case_types, file_names

import 'package:flutter/material.dart';

class frmMozo extends StatefulWidget {
  const frmMozo({super.key});

  @override
  State<frmMozo> createState() => _frmMozo();
}

class _frmMozo extends State<frmMozo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text("Secciòn Mozo"),
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
                          child: const Text('Realizar pedido'),
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
