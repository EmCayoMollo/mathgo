import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/aritmetica/aritmeticaMenu.dart';
import 'package:mathgo/nivelesMenu/aritmetica/ejercicio3.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../nivelSuperado/nivelSuperado.dart';

class Ejercicio2 extends StatefulWidget {
const Ejercicio2({super.key});

  @override
  State<Ejercicio2> createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  String? _resultadoSeleccionado;
  final String _resultadoCorrecto= '17';
  Future<void> _marcarCompletado() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('suma2', true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {},
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
          title: const Text('Ejercicio 2'),
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
                  '17 - 4 + 8 - 4 =',
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
                  children: ['5', '12', '9', '17'].map((valor) {
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
              TextButton(onPressed: () {
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
                  _marcarCompletado();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NivelSuperado(
                      siguienteNivel: Ejercicio3(),
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

            ],
          ),
        ),

      ),
    );
  }
}
