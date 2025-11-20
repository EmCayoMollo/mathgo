import 'package:flutter/material.dart';
import 'package:mathgo/nivelSuperado/nivelSuperadoAlgebra.dart';
import 'package:mathgo/nivelesMenu/algebra/algebraMenu.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio4.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final _numeroController1 = TextEditingController();
  final _numeroController2 = TextEditingController();
  final _numeroController3 = TextEditingController();
  final _numeroController4 = TextEditingController();


  final String numero1correcto='2x';
  final int numero2correcto=3;
  final int numero3correcto=3;
  final int numero4correcto=4;



  Future<void> _marcarCompletado() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('alg3', true);
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
              MaterialPageRoute(builder: (context) => const AlgebraMenu()),
                  (Route<dynamic> route) => false,
            );
          },
              icon: const Icon(Icons.arrow_back, )
          ),
          title: const Text('Ejercicio 3'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/profetxt.png'),
                  const SizedBox(height: 20,),
                  Text('suma usando la x como comun denominador!'),
                  const SizedBox(height: 20,),
                  Container(
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topCenter,
                    height: 260,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        Text('5x-3=2x+9',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('5x-',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: TextField(
                                key: const ValueKey('numero1'),
                                controller: _numeroController1,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(border: OutlineInputBorder(), hintText: '?',contentPadding: EdgeInsets.zero),
                              ),
                            ),
                            Text('=9+',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: TextField(
                                key: const ValueKey('numero2'),
                                controller: _numeroController2,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(border: OutlineInputBorder(), hintText: '?',contentPadding: EdgeInsets.zero),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: TextField(
                                key: const ValueKey('numero3'),
                                controller: _numeroController3,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(border: OutlineInputBorder(), hintText: '?',contentPadding: EdgeInsets.zero),
                              ),
                            ),
                            Text('x=12',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('x=',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            SizedBox(
                              height: 75,
                              width: 35,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(child: Text('12',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)),
                                  const Divider(color: Colors.black, thickness: 2, height: 10),
                                  Expanded(child: Text('3',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),)),
                                ],
                              ),
                            ),
                            Text('=',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: TextField(
                                key: const ValueKey('numero4'),
                                controller: _numeroController4,
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(border: OutlineInputBorder(), hintText: '?',contentPadding: EdgeInsets.zero),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextButton(
                    onPressed: (){
                      final numero1 = _numeroController1.text;
                      final numero2 = int.tryParse(_numeroController2.text);
                      final numero3 = int.tryParse(_numeroController3.text);
                      final numero4 = int.tryParse(_numeroController4.text);

                      if(numero1.isEmpty || numero2==null || numero3==null || numero4==null ){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, completa el ejercicio.',style: TextStyle(fontSize: 20,),),
                            backgroundColor: Colors.orange,
                          ),
                        );
                        return;
                      }
                      if( numero1==numero1correcto
                          && numero2==numero2correcto
                          && numero3==numero3correcto
                          && numero4==numero4correcto
                      ){
                        _marcarCompletado();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const NivelSuperadoAlgebra(
                            siguienteNivel: Ejercicio4(),
                          )),
                        );
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Respuesta incorrecta. ¡Inténtalo de nuevo!'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child:Text('CONFIRMAR',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
