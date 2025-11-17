import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/nivelesMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio1.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio2.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio3.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio4.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio5.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio6.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio7.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio8.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio9.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio10.dart';


class FraccionesMenu extends StatefulWidget {
  const FraccionesMenu({super.key});

  @override
  State<FraccionesMenu> createState() => _FraccionesMenuState();
}

class _FraccionesMenuState extends State<FraccionesMenu> {
  final Map<String, bool> _nivelesCompletados = {};
  @override
  void initState() {
    super.initState();
    _cargarProgreso();
  }
  Future<void> _cargarProgreso() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nivelesCompletados['fraccion1'] = prefs.getBool('fraccion1') ?? false;
      _nivelesCompletados['fraccion2'] = prefs.getBool('fraccion2') ?? false;
      _nivelesCompletados['fraccion3'] = prefs.getBool('fraccion3') ?? false;
      _nivelesCompletados['fraccion4'] = prefs.getBool('fraccion4') ?? false;
      _nivelesCompletados['fraccion5'] = prefs.getBool('fraccion5') ?? false;
      _nivelesCompletados['fraccion6'] = prefs.getBool('fraccion6') ?? false;
      _nivelesCompletados['fraccion7'] = prefs.getBool('fraccion7') ?? false;
      _nivelesCompletados['fraccion8'] = prefs.getBool('fraccion8') ?? false;
      _nivelesCompletados['fraccion9'] = prefs.getBool('fraccion9') ?? false;
      _nivelesCompletados['fraccion10'] = prefs.getBool('fraccion10') ?? false;
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
          title: const Text('Fracciones Menu'),
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
                  title: Center(
                    child: Text(
                      _nivelesCompletados['suma1']== true? 'Ejercicio 1' : 'Ejercicio 1',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: _nivelesCompletados['suma1']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio1()),
                    ).then((_)=> _cargarProgreso());
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _nivelesCompletados['ejercicio2']== true? 'Ejercicio 2' : 'Ejercicio 2',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio2']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio2()),
                    ).then((_)=> _cargarProgreso());
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _nivelesCompletados['ejercicio3']==true? 'Ejercicio 3' : 'Ejercicio 3',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio3']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio3()),
                    ).then((_)=> _cargarProgreso());
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _nivelesCompletados['ejercicio4']==true? 'Ejercicio 4' : 'Ejercicio 4',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio4']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio4()),
                    ).then((_)=> _cargarProgreso());
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _nivelesCompletados['ejercicio5']==true? 'Ejercicio 5' : 'Ejercicio 5',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio5']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio5()),
                    ).then((_)=> _cargarProgreso());
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _nivelesCompletados['ejercicio6']==true? 'Ejercicio 6' : 'Ejercicio 6',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio6']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio6()),
                    ).then((_)=> _cargarProgreso());
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _nivelesCompletados['ejercicio7']==true? 'Ejercicio 7' : 'Ejercicio 7',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio7']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio7()),
                    ).then((_)=> _cargarProgreso());
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _nivelesCompletados['ejercicio8']==true? 'Ejercicio 8' : 'Ejercicio 8',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio8']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio8()),
                    ).then((_)=> _cargarProgreso());
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _nivelesCompletados['ejercicio9']==true? 'Ejercicio 9' : 'Ejercicio 9',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio9']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio9()),
                    ).then((_)=> _cargarProgreso());
                  },
                ),
                ListTile(
                  title: Center(
                    child: Text(
                      _nivelesCompletados['ejercicio10']==true? 'Ejercicio 10' : 'Ejercicio 10',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio10']==true
                      ? const Icon(Icons.check_circle, color: Colors.green)
                      : null ,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Ejercicio10()),
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
