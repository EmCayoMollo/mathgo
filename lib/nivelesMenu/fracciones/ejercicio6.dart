import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../nivelSuperado/nivelSuperadoFracciones.dart';
import 'fraccionesmenu.dart';


class Ejercicio6 extends StatefulWidget {
  const Ejercicio6({super.key});

  @override
  State<Ejercicio6> createState() => _Ejercicio6State();
}

class _Ejercicio6State extends State<Ejercicio6> {
  final _numeradorController1 = TextEditingController();
 // final _denominadorController1 = TextEditingController();
  final _numeradorController2 = TextEditingController();
  final _denominadorController2 = TextEditingController();
  final _numeradorController3 = TextEditingController();
  final _denominadorController3 = TextEditingController();

  final String _numeradorCorrecto1 = '5';
  //final String _denominadorCorrecto1 = '12';
  final String _numeradorCorrecto2 = '3';
  final String _denominadorCorrecto2 = '6';
  //final string _numeradorCorrecto3='1';
  //final string _denominadorCorrecto3='2';


  Future<void> _marcarCompletado() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('fraccion1', true);
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop,dynamic result) {},
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
          title: const Text('Ejercicio 6'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(child: Image.asset('assets/images/profetxt.png')),
              const SizedBox(height: 10,),
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
                        Column(
                          children: const [
                            Text('5', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(width: 40, child: Divider(color: Colors.black, thickness: 2)),
                            Text('6', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('-', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                        Column(
                          children: const [
                            Text('1', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(width: 40, child: Divider(color: Colors.black, thickness: 2)),
                            Text('3', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      key: ValueKey('numerador1'),
                                      controller: _numeradorController1,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                                    ),
                                  ),
                                  Text(' - 2',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                                ],
                              ),
                              const Divider(color: Colors.black, thickness: 2, height: 10),
                              /*TextField(
                                key: ValueKey('denominador1'),
                                controller: _denominadorController1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                              ),*/
                              Text('6',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('=', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        ),

                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('=', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          width: 80,
                          child: Column(
                            children: [
                              TextField(
                                key: const ValueKey('numerador2'),
                                controller: _numeradorController2,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                              ),
                              const Divider(color: Colors.black, thickness: 2, height: 10),
                              TextField(
                                key: const ValueKey('denominador2'),
                                controller: _denominadorController2,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                              ),
                            ],
                          ),
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
                                key: const ValueKey('numerador3'),
                                controller: _numeradorController3,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                              ),
                              const Divider(color: Colors.black, thickness: 2, height: 10),
                              TextField(
                                key: const ValueKey('denominador3'),
                                controller: _denominadorController3,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                              ),
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
                  final numRespuesta2 = _numeradorController2.text;
                  final denRespuesta2 = _denominadorController2.text;



                  if (numRespuesta1.isEmpty || numRespuesta2.isEmpty || denRespuesta2.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, completa la fracción.'),
                        backgroundColor: Colors.orange,
                      ),
                    );
                    return;
                  }

                  if (numRespuesta1 == _numeradorCorrecto1 && numRespuesta2 == _numeradorCorrecto2 && denRespuesta2 == _denominadorCorrecto2) {
                    _marcarCompletado();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NivelSuperadoFracciones(
                        siguienteNivel: Ejercicio6(),
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
