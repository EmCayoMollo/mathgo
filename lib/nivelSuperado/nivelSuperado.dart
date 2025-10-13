import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/nivelesMenu.dart';

class NivelSuperado extends StatelessWidget {
  // 1. Añade una variable para recibir el widget del siguiente nivel.
  final Widget siguienteNivel;

  // 2. Actualiza el constructor para que acepte este widget.
  const NivelSuperado({
    super.key,
    required this.siguienteNivel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Usamos WillPopScope para evitar que el usuario use el botón "atrás" del sistema
      body: WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Nivel Superado',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  fontSize: 55,
                  height: 1,
                ),
              ),

              const SizedBox(height: 30), // Añade un espacio

              // --- BOTÓN SIGUIENTE NIVEL ---
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () {
                  // Reemplaza la pantalla actual y la anterior (Suma1) con la del siguiente nivel.
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => siguienteNivel),
                  );
                },
                child: const Text(
                  'Siguiente Nivel',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 20), // Añade un espacio

              // --- BOTÓN SALIR AL MENÚ ---
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                onPressed: () {
                  // Cierra todas las pantallas hasta llegar a NivelesMenu
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const NivelesMenu()),
                        (Route<dynamic> route) => false,
                  );
                },
                child: const Text(
                  'Salir',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
