import 'package:flutter/material.dart';
import 'package:mathgo/nivelSuperado/nivelSuperado.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'aritmeticaMenu.dart';

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final respuesta1 = TextEditingController();
  final respuesta2 = TextEditingController();
  final respuesta3 = TextEditingController();
  final resultadoCorrecto1=70;
  final resultadoCorrecto2=5;
  final resultadoCorrecto3=4;
  Future<void> _marcarComoCompletado() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('ejercicio3', true);
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result){},
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
          title: Text('Ejercicio 3'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 306,
                height: 306,
                decoration:BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                    width: 3,
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.green,
                          child: Center(
                            child: Text(
                              '2 × 5 × 7 =',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.red,
                          child: Center(
                            child: Text(
                              '10 ÷ 2 =',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.blue,
                          child: Center(
                            child: Text(
                              '(12×2)÷6 =',
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.green,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: TextField(
                                controller: respuesta1,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '??',
                                  hintStyle: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                                onChanged: (value){},
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: TextField(
                                controller: respuesta2,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '??',
                                  hintStyle: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Center(
                              child: TextField(
                                controller: respuesta3,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: '??',
                                  hintStyle: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 50),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
              onPressed: () {
                final valor1 = int.tryParse(respuesta1.text);
                final valor2 = int.tryParse(respuesta2.text);
                final valor3 = int.tryParse(respuesta3.text);

                if(valor1==resultadoCorrecto1){
                  if(valor2==resultadoCorrecto2){
                    if(valor3==resultadoCorrecto3) {
                      _marcarComoCompletado();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context)=> const NivelSuperado(
                              siguienteNivel: Ejercicio3())
                          )
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Respuesta 3 incorrecta'),
                          duration: Duration(seconds: 1),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                    }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Respuesta 2 incorrecta'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  }
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Respuesta 1 incorrecta'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
              child: const Text(
                'Confirmar',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
