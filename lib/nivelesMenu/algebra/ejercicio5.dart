import 'package:flutter/material.dart';
import 'package:mathgo/nivelSuperado/nivelSuperadoAlgebra.dart';
import 'package:mathgo/nivelesMenu/algebra/algebraMenu.dart';
import 'package:mathgo/nivelesMenu/algebra/ejercicio6.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ejercicio5 extends StatefulWidget {
  const Ejercicio5({super.key});

  @override
  State<Ejercicio5> createState() => _Ejercicio5State();
}

class _Ejercicio5State extends State<Ejercicio5> {
  final _numeroController1 = TextEditingController();
  final _numeroController2 = TextEditingController();
  final _numeroController3 = TextEditingController();
  final _numeroController4 = TextEditingController();


  final String numero1correcto='2x+8';
  final String numero2correcto='2x';
  final String numero3correcto='x';
  final int numero4correcto=14;

  Future<void> _marcarCompletado() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('alg5', true);
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
          title: const Text('Ejercicio 5'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Image.asset('assets/images/profetxt.png')),
              const SizedBox(height: 20,),
              Text('suma usando la y como comun denominador!'),
              const SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.topCenter,
                height: 200,
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
                    Text('3(x-2)=2(x+4)',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('3x-6=',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                        SizedBox(
                          height: 30,
                          width: 70,
                          child: TextField(
                            key: const ValueKey('numero1'),
                            controller: _numeroController1,
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
                        Text('3x-',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
                        Text('=8+6',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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

                  if(numero1.isEmpty || numero2.isEmpty || numero3.isEmpty || numero4==null ){
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
                        siguienteNivel: Ejercicio6(),
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
