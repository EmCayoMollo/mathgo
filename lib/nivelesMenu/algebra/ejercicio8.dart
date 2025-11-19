import 'package:flutter/material.dart';
import 'package:mathgo/nivelSuperado/nivelSuperadoAlgebra.dart';
import 'package:mathgo/nivelesMenu/algebra/algebraMenu.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio9.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ejercicio8 extends StatefulWidget {
  const Ejercicio8({super.key});

  @override
  State<Ejercicio8> createState() => _Ejercicio8State();
}

class _Ejercicio8State extends State<Ejercicio8> {

  final _numeroController1 = TextEditingController();
  final _numeroController2 = TextEditingController();
  final _numeroController3 = TextEditingController();
  final _numeroController4 = TextEditingController();
  final _numeroController5 = TextEditingController();
  final _numeroController6 = TextEditingController();

  final int numero1correcto=4;
  final int numero2correcto=12;
  final int numero3correcto=1;
  final int numero4correcto=13;
  final int numero5correcto=13;
  final int numero6correcto=2;

  Future<void> _marcarCompletado() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('alg8', true);
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
          title: const Text('Ejercicio 8'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.asset('assets/images/profetxt.png')),
              const SizedBox(height: 20,),
              Text('el producto de ( - por - es + ) y (- por + es -)!'),
              const SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                height: 280,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 80,
                          width: 90,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 35,
                                width: 60,
                                  child: Text('2x-1',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                              const Divider(color: Colors.black, thickness: 2, height: 10),
                              SizedBox(
                                height: 35,
                                width: 35,
                                  child: Text('4',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
                            ],
                          ),
                        ),
                        Text('=3',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('2x-1=3×',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: TextField(
                            key: const ValueKey('numero1'),
                            controller: _numeroController1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(border: OutlineInputBorder(), hintText: '?',contentPadding: EdgeInsets.zero),
                          ),
                        ),
                        Text('=',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                        Text('2x=12+',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                        Text('=',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: TextField(
                            key: const ValueKey('numero4'),
                            controller: _numeroController4,
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
                        Text('x=',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 70,
                          width: 30,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: TextField(
                                  key: const ValueKey('numero5'),
                                  controller: _numeroController5,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: '?',contentPadding: EdgeInsets.zero),
                                ),
                              ),
                              const Divider(color: Colors.black, thickness: 2, height: 10),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: TextField(
                                  key: const ValueKey('numero6'),
                                  controller: _numeroController6,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(border: OutlineInputBorder(), hintText: '?',contentPadding: EdgeInsets.zero),
                                ),
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
                onPressed: (){
                  final numero1 = int.tryParse(_numeroController1.text);
                  final numero2 = int.tryParse(_numeroController2.text);
                  final numero3 = int.tryParse(_numeroController3.text);
                  final numero4 = int.tryParse(_numeroController4.text);
                  final numero5 = int.tryParse(_numeroController5.text);
                  final numero6 = int.tryParse(_numeroController6.text);


                  if(numero1==null
                      || numero2==null
                      || numero3==null
                      || numero4==null
                      || numero5==null
                      || numero6==null
                  ){
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
                      && numero5==numero5correcto
                      && numero6==numero6correcto
                  ){
                    _marcarCompletado();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NivelSuperadoAlgebra(
                        siguienteNivel: Ejercicio9(),
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
                style: ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(20)),
                  backgroundColor: WidgetStateColor.resolveWith((states) => Colors.green),
                  foregroundColor: WidgetStateColor.resolveWith((states)=> Colors.black),
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
    );
  }
}
