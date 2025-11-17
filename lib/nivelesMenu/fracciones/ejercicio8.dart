import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio9.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../nivelSuperado/nivelSuperadoFracciones.dart';
import 'fraccionesmenu.dart';

class Ejercicio8 extends StatefulWidget {
  const Ejercicio8({super.key});

  @override
  State<Ejercicio8> createState() => _Ejercicio8State();
}

class _Ejercicio8State extends State<Ejercicio8> {
  final _numeradorController1 = TextEditingController();
  //final _denominadorController1 = TextEditingController();
  //final _numeradorController2 = TextEditingController();
  //final _denominadorController2 = TextEditingController();
  final String _numeradorCorrecto1 = '17';
  //final String _denominadorCorrecto1 = '12';
  //final String _numeradorCorrecto2 = '3';
  //final String _denominadorCorrecto2 = '4';

  Future<void> _marcarCompletado() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('fraccion1', true);
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop,dynamic result){},
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const FraccionesMenu()),
                  (Route<dynamic> route) => false,
            );
          },
              icon: const Icon(Icons.arrow_back, )
          ),
          title: const Text('Ejercicio 8'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Image.asset('assets/images/profetxt.png')),
              const SizedBox(height: 10,),
              Text(
                  'multiplica el 4 con el denominador 7 y suma el numerador 3 para dar con el resultado',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.black,
                      width: 3
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('2', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                        Column(
                          children: const [
                            Text('3', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(width: 40, child: Divider(color: Colors.black, thickness: 2)),
                            Text('7', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('=', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                                  TextField(
                                  key: ValueKey('numerador1'),
                                  controller: _numeradorController1,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                                ),
                              const Divider(color: Colors.black, thickness: 2, height: 10),
                              Text('7',style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20,),
              TextButton(
                onPressed: () {
                  final numRespuesta1 = _numeradorController1.text;
                  //final denRespuesta1 = _denominadorController1.text;
                  //final numRespuesta2 = _numeradorController2.text;
                  //final denRespuesta2 = _denominadorController2.text;

                  if (numRespuesta1.isEmpty ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, completa la fracción.'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    return;
                  }

                  if (numRespuesta1 == _numeradorCorrecto1 ) {
                    _marcarCompletado();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NivelSuperadoFracciones(
                        siguienteNivel: Ejercicio9(),
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
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
                  backgroundColor: WidgetStateColor.resolveWith((states) => Colors.green),
                  foregroundColor: WidgetStateColor.resolveWith((states) => Colors.black),
                ),
                child:  const Text(
                    'CONFIRMAR',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    )
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
