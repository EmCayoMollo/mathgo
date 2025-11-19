import 'package:flutter/material.dart';
import '../../nivelSuperado/nivelSuperado.dart';
import 'aritmeticaMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ejercicio5.dart';

class Ejercicio4 extends StatefulWidget {
  const Ejercicio4({super.key});

  @override
  State<Ejercicio4> createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {

  String? _resultadoSeleccionado;
  final String _resultadoCorrecto= '36';
  Future<void> _marcarComoCompletado() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ejercicio4', true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, dynamic result){},
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const AritmeticaMenu()),
                    (Route<dynamic> route) => false,
              );
            },
                icon: const Icon(Icons.arrow_back, )
            ),
            title: Text('Ejercicio 4')
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Image.asset('assets/images/profetxt.png')),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    '(9 + 3) × (6 ÷ 2) =',
                    style: TextStyle(fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.black,
                        width: 3
                    ),

                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  width: 300,
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children: ['36', '12', '9', '17'].map((valor) {
                      return ChoiceChip(
                        label: Text(valor, style: const TextStyle(fontSize: 20)),
                        selected: _resultadoSeleccionado == valor,
                        onSelected: (bool seleccionado) {
                          setState(() {
                            if (seleccionado) {
                              _resultadoSeleccionado = valor;
                            }
                          });
                        },
                        selectedColor: Colors.greenAccent,
                        backgroundColor: Colors.lightBlueAccent,
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20,),
                TextButton(
                  onPressed: () {
                  if (_resultadoSeleccionado == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, elige una respuesta.'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    return;
                  }

                  if (_resultadoSeleccionado == _resultadoCorrecto) {
                    _marcarComoCompletado();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NivelSuperado(
                        siguienteNivel: Ejercicio5(),
                      )),
                    );
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Respuesta incorrecta. ¡Inténtalo de nuevo!'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                  child: const Text(
                      'CONFIRMAR',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                      )
                  ),
                  style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
                    backgroundColor: WidgetStateColor.resolveWith((states) => Colors.green),
                    foregroundColor: WidgetStateColor.resolveWith((states) => Colors.black),
                  ),
                ),
                const SizedBox(height: 30,),
              ],
            ),
          ),

        ),
    );
  }
}
