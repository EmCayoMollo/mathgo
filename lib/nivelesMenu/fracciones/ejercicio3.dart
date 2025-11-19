import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/fracciones/ejercicio4.dart';
import '../../nivelSuperado/nivelSuperadoFracciones.dart';
import 'fraccionesmenu.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final _numeradorController = TextEditingController();
  final _denominadorController = TextEditingController();
  final String _numeradorCorrecto = '6';
  final String _denominadorCorrecto = '15';

  Future<void> _marcarCompletado() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('fraccion3', true);
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
          title: const Text('Ejercicio 3'),
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
                          child: Text('×', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        ),
                        Column(
                          children: [
                            Text('3', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(width: 40, child: Divider(color: Colors.black, thickness: 2)),
                            Text('5', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text('=', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                        ),

                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Text('2 × 3', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                            SizedBox(width: 80, child:   Divider(color: Colors.black, thickness: 2)),
                            Text('3 × 5', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
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
                                controller: _numeradorController,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(border: OutlineInputBorder(), hintText: '?'),
                              ),
                              const Divider(color: Colors.black, thickness: 2, height: 10),
                              TextField(
                                controller: _denominadorController,
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
              TextButton(onPressed: () {
                final numRespuesta = _numeradorController.text;
                final denRespuesta = _denominadorController.text;

                if (numRespuesta.isEmpty || denRespuesta.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Por favor, completa la fracción.'),
                      backgroundColor: Colors.orange,
                    ),
                  );
                  return;
                }

                if (numRespuesta == _numeradorCorrecto && denRespuesta == _denominadorCorrecto) {
                  _marcarCompletado();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NivelSuperadoFracciones(
                      siguienteNivel: Ejercicio4(),
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
