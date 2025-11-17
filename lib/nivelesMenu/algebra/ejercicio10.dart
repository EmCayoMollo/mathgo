import 'package:flutter/material.dart';
import 'package:mathgo/nivelSuperado/final.dart';
import 'package:mathgo/nivelSuperado/nivelSuperadoAlgebra.dart';
import 'package:mathgo/nivelesMenu/algebra/algebraMenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ejercicio10 extends StatefulWidget {
  const Ejercicio10({super.key});

  @override
  State<Ejercicio10> createState() => _Ejercicio10State();
}

class _Ejercicio10State extends State<Ejercicio10> {
  final _numeroController1 = TextEditingController();
  final _numeroController2 = TextEditingController();
  final _numeroController3 = TextEditingController();
  final _numeroController4 = TextEditingController();
  final _numeroController5 = TextEditingController();
  final _numeroController6 = TextEditingController();
  final _numeroController7 = TextEditingController();


  final String numero1correcto='2x';
  final String numero2correcto='5x';
  final String numero3correcto='2x';
  final int numero4correcto=5;
  final int numero5correcto=5;
  final int numero6correcto=2;
  final int numero7correcto=1;


  Future<void> _marcarCompletado() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('suma2', true);
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
          title: const Text('Ejercicio 10'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Expanded(child: Image.asset('assets/images/profetxt.png')),
              const SizedBox(height: 20,),
              Text('un dato de ayuda -2x+5x es igual a 3x!'),
              const SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                height: 400,
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
                        Text('2x²+3x-5=0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('2x²-',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                        Text('+',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                        Text('-5=0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('(2x²-2x)+(5x-5)=0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                        Text('(x-1)+',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                        Text('(x-1)=0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('(2x-5)+(x-1)=0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('2x-5=0            x-1=0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
                      ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text('x₁=',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                        Text('              x₂=',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: TextField(
                            key: const ValueKey('numero7'),
                            controller: _numeroController7,
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
                  final numero2 = _numeroController2.text;
                  final numero3 = _numeroController3.text;
                  final numero4 = int.tryParse(_numeroController4.text);
                  final numero5 = int.tryParse(_numeroController5.text);
                  final numero6 = int.tryParse(_numeroController6.text);
                  final numero7 = int.tryParse(_numeroController7.text);



                  if(numero1.isEmpty
                      || numero2.isEmpty
                      || numero3.isEmpty
                      || numero4==null
                      || numero5==null
                      || numero6==null
                      || numero7==null
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
                      MaterialPageRoute(builder: (context) => const Final()),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
