import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/aritmetica/suma1.dart';
import 'package:mathgo/nivelesMenu/aritmetica/suma2.dart';
import 'package:mathgo/nivelesMenu/nivelesMenu.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importa el menú de niveles

class AritmeticaMenu extends StatefulWidget {
  const AritmeticaMenu({super.key});

  @override
  State<AritmeticaMenu> createState() => _AritmeticaMenuState();
}

class _AritmeticaMenuState extends State<AritmeticaMenu> {
  final Map<String, bool> _nivelesCompletados = {};
  @override
  void initState() {
    super.initState();
    _cargarProgreso();
  }
  Future<void> _cargarProgreso() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nivelesCompletados['suma1'] = prefs.getBool('suma1') ?? false;
      _nivelesCompletados['suma2'] = prefs.getBool('suma2') ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NivelesMenu()),
              (Route<dynamic> route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Aritmetica Menu'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const NivelesMenu()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ),
        body: Center(
          child: ListView(
            children: <Widget> [
              ListTile(
                title: Text(
                  _nivelesCompletados['suma1']== true? 'Ejercicio 1' : 'Ejercicio 1',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                trailing: _nivelesCompletados['suma1']==true
                ? const Icon(Icons.check_circle, color: Colors.green)
                : null ,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Suma1()),
                  ).then((_)=> _cargarProgreso());
                },
              ),
              ListTile(
                title: Text(
                  _nivelesCompletados['suma2']== true? 'Ejercicio 2' : 'Ejercicio 2',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                trailing: _nivelesCompletados['suma2']==true
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : null ,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Suma2()),
                  ).then((_)=> _cargarProgreso());
                },
              ),
            ]
          ),
        ),
      ),
    );
  }
}
