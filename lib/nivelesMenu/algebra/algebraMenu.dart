import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio1.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio2.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio3.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio4.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio5.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio6.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio7.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio8.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio9.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio10.dart';
import 'package:mathgo/nivelesMenu/nivelesMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AlgebraMenu extends StatefulWidget {
  const AlgebraMenu({super.key});

  @override
  State<AlgebraMenu> createState() => _AlgebraMenuState();
}

class _AlgebraMenuState extends State<AlgebraMenu> {
  final Map<String, bool> _nivelesCompletados = {};
  @override
  void initState() {
    super.initState();
    _cargarProgreso();
  }
  Future<void> _cargarProgreso() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nivelesCompletados['alg1'] = prefs.getBool('alg1') ?? false;
      _nivelesCompletados['alg2'] = prefs.getBool('alg2') ?? false;
      _nivelesCompletados['alg3'] = prefs.getBool('alg3') ?? false;
      _nivelesCompletados['alg4'] = prefs.getBool('alg4') ?? false;
      _nivelesCompletados['alg5'] = prefs.getBool('alg5') ?? false;
      _nivelesCompletados['alg6'] = prefs.getBool('alg6') ?? false;
      _nivelesCompletados['alg7'] = prefs.getBool('alg7') ?? false;
      _nivelesCompletados['alg8'] = prefs.getBool('alg8') ?? false;
      _nivelesCompletados['alg9'] = prefs.getBool('alg9') ?? false;
      _nivelesCompletados['alg10'] = prefs.getBool('alg10') ?? false;
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
          backgroundColor: Colors.transparent,
          title: const Text('Algebra Menu'),
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
                      _nivelesCompletados['alg1']== true? 'Ejercicio 1' : 'Ejercicio 1',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg1']==true
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
                      _nivelesCompletados['alg2']== true? 'Ejercicio 2' : 'Ejercicio 2',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg2']==true
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
                      _nivelesCompletados['alg3']==true? 'Ejercicio 3' : 'Ejercicio 3',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg3']==true
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
                      _nivelesCompletados['alg4']==true? 'Ejercicio 4' : 'Ejercicio 4',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg4']==true
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
                      _nivelesCompletados['alg5']==true? 'Ejercicio 5' : 'Ejercicio 5',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg5']==true
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
                      _nivelesCompletados['alg6']==true? 'Ejercicio 6' : 'Ejercicio 6',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg6']==true
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
                      _nivelesCompletados['alg7']==true? 'Ejercicio 7' : 'Ejercicio 7',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg7']==true
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
                      _nivelesCompletados['alg8']==true? 'Ejercicio 8' : 'Ejercicio 8',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg8']==true
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
                      _nivelesCompletados['alg9']==true? 'Ejercicio 9' : 'Ejercicio 9',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg9']==true
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
                      _nivelesCompletados['alg10']==true? 'Ejercicio 10' : 'Ejercicio 10',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: _nivelesCompletados['alg10']==true
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
