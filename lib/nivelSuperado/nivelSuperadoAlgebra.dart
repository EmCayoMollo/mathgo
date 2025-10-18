import 'package:flutter/material.dart';
class Nivelsuperadoalgebra extends StatefulWidget {
  const Nivelsuperadoalgebra({super.key});

  @override
  State<Nivelsuperadoalgebra> createState() => _NivelsuperadoalgebraState();
}

class _NivelsuperadoalgebraState extends State<Nivelsuperadoalgebra> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result){},
      child:Scaffold(),
    );
  }
}
