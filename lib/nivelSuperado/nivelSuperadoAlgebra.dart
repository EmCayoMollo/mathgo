import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mathgo/nivelesMenu/algebra/algebraMenu.dart';
import 'package:mathgo/nivelesMenu/nivelesMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NivelSuperadoAlgebra extends StatefulWidget {
  final Widget siguienteNivel;

  const NivelSuperadoAlgebra({
    super.key,
    required this.siguienteNivel,
  });

  @override
  State<NivelSuperadoAlgebra> createState() => _NivelSuperadoAlgebraState();
}

class _NivelSuperadoAlgebraState extends State<NivelSuperadoAlgebra> {
  String nombreUsuario = '';

  @override
  void initState() {
    super.initState();
    _cargarNombre();
  }

  Future<void> _cargarNombre() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nombreUsuario = prefs.getString('nombreUsuario') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop,dynamic result){},
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image:AssetImage('assets/images/fondo.png'),
                fit: BoxFit.cover,
              )
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Lottie.asset('assets/lottie/heart.json',animate: true)),
                Text(
                  'Nivel Superado $nombreUsuario',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontSize: 55,
                    height: 1,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => widget.siguienteNivel),
                    );
                  },
                  child: const Text(
                    'Siguiente Nivel',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const AlgebraMenu()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text(
                    'volver a menu ejercicos',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const NivelesMenu()),
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: const Text(
                    'Salir al menu niveles',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
