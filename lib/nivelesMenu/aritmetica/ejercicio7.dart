import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/aritmetica/ejercicio8.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../nivelSuperado/nivelSuperado.dart';
import 'aritmeticaMenu.dart';

class Ejercicio7 extends StatefulWidget {
  const Ejercicio7({super.key});

  @override
  State<Ejercicio7> createState() => _Ejercicio7State();
}

class _Ejercicio7State extends State<Ejercicio7> {
  String? _resultadoSeleccionado;
  final String _resultadoCorrecto= '14';
  Future<void> _marcarCompletado() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ejercicio7', true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop,dynamic result ){},
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
          title: const Text('Ejercicio 7'),
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
                  '28 ÷ 4 +7 =',
                  style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                  children: ['5', '14', '9', '17'].map((valor) {
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
                      siguienteNivel: Ejercicio8(),
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
