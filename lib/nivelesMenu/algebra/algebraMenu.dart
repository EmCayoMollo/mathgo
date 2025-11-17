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
      _nivelesCompletados['algebra1'] = prefs.getBool('algebra1') ?? false;
      _nivelesCompletados['algebra2'] = prefs.getBool('algebra2') ?? false;
      _nivelesCompletados['algebra3'] = prefs.getBool('algebra3') ?? false;
      _nivelesCompletados['algebra4'] = prefs.getBool('algebra4') ?? false;
      _nivelesCompletados['algebra5'] = prefs.getBool('algebra5') ?? false;
      _nivelesCompletados['algebra6'] = prefs.getBool('algebra6') ?? false;
      _nivelesCompletados['algebra7'] = prefs.getBool('algebra7') ?? false;
      _nivelesCompletados['algebra8'] = prefs.getBool('algebra8') ?? false;
      _nivelesCompletados['algebra9'] = prefs.getBool('algebra9') ?? false;
      _nivelesCompletados['algebra10'] = prefs.getBool('algebra10') ?? false;
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
                      _nivelesCompletados['ejercicio1']== true? 'Ejercicio 1' : 'Ejercicio 1',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  trailing: _nivelesCompletados['ejercicio1']==true
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
