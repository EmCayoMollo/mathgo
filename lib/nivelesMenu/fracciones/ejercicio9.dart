import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio10.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../nivelSuperado/nivelSuperadoFracciones.dart';
import 'fraccionesmenu.dart';


class Ejercicio9 extends StatefulWidget {
  const Ejercicio9({super.key});

  @override
  State<Ejercicio9> createState() => _Ejercicio9State();
}

class _Ejercicio9State extends State<Ejercicio9> {
  final _numeradorController1 = TextEditingController();
  final _denominadorController1 = TextEditingController();
  final _numeradorController2 = TextEditingController();
  final _denominadorController2 = TextEditingController();
  final _numeradorController3 = TextEditingController();
  final _denominadorController3 = TextEditingController();
  final _numeradorController4 = TextEditingController();

  final int _numeradorCorrecto1 = 3;
  final int _denominadorCorrecto1 =4;
  final int _numeradorCorrecto2 = 8;
  final int _denominadorCorrecto2 = 12;
  final int _numeradorCorrecto3=9;
  final int _denominadorCorrecto3=17;
  final int _numeradorCorrecto4=12;

  Future<void> _marcarCompletado() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('fraccion9', true);
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
          title: const Text('Ejercicio 9'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Image.asset('assets/images/profetxt.png')),
                const SizedBox(height: 10,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                              Text('2', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                              SizedBox(width: 40, child: Divider(color: Colors.black, thickness: 2)),
                              Text('3', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('+', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                          ),
                          Column(
                            children: const [
                              Text('1', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                              SizedBox(width: 40, child: Divider(color: Colors.black, thickness: 2)),
                              Text('2', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('×', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                          ),
                          Column(
                            children: const [
                              Text('3', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                              SizedBox(width: 40, child: Divider(color: Colors.black, thickness: 2)),
                              Text('2', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('=', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      //esta fila solo el ejercicio
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: const [
                              Text('2', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                              SizedBox(width: 40, child: Divider(color: Colors.black, thickness: 2)),
                              Text('3', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text('+', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              children: [
                                TextField(
                                  key: const ValueKey('numerador1'),
                                  controller: _numeradorController1,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                                ),
                                const Divider(color: Colors.black, thickness: 2, height: 10),
                                TextField(
                                  key: const ValueKey('denominador1'),
                                  controller: _denominadorController1,
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
                                Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        key: const ValueKey('numerador2'),
                                        controller: _numeradorController2,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                                      ),
                                    ),
                                    Text(' + ',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                    Expanded(
                                      child: TextField(
                                        key: const ValueKey('numerador3'),
                                        controller: _numeradorController3,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                                      ),
                                    ),
                                  ],
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
                                  key: const ValueKey('numerador4'),
                                  controller: _numeradorController4,
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
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 20,),
                TextButton(
                  onPressed: () {
                    final numRespuesta1 = _numeradorController1.text;
                    final denRespuesta1 = _denominadorController1.text;
                    final numRespuesta2 = _numeradorController2.text;
                    final denRespuesta2 = _denominadorController2.text;
                    final numRespuesta3 = _numeradorController3.text;
                    final denRespuesta3 = _denominadorController3.text;
                    final numRespuesta4 = _numeradorController4.text;



                    if (
                    numRespuesta1.isEmpty ||
                        numRespuesta2.isEmpty ||
                        numRespuesta3.isEmpty ||
                        numRespuesta4.isEmpty ||
                        denRespuesta1.isEmpty ||
                        denRespuesta2.isEmpty ||
                        denRespuesta3.isEmpty
                    ) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Por favor, completa la fracción.'),
                          backgroundColor: Colors.orange,
                        ),
                      );
                      return;
                    }

                    if (numRespuesta1 == _numeradorCorrecto1
                        && numRespuesta2 == _numeradorCorrecto2
                        && numRespuesta3 == _numeradorCorrecto3
                        && numRespuesta4 == _numeradorCorrecto4
                        && denRespuesta1 == _denominadorCorrecto1
                        && denRespuesta2 == _denominadorCorrecto2
                        && denRespuesta3 == _denominadorCorrecto3
                    ) {
                      _marcarCompletado();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NivelSuperadoFracciones(
                          siguienteNivel: Ejercicio10(),
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
      ),
    );
  }
}
