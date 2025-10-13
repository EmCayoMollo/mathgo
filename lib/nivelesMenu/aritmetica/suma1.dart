import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathgo/nivelSuperado/nivelSuperado.dart';
import 'package:mathgo/nivelesMenu/aritmetica/suma2.dart';

import '../nivelesMenu.dart';

class Suma1 extends StatefulWidget {
  const Suma1({super.key});

  @override
  State<Suma1> createState() => _Suma1State();
}

class _Suma1State extends State<Suma1> {
  String? _resultadoSeleccionado;
  final String _resultadoCorrecto= '12';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: () {
          Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const NivelesMenu()),
              (Route<dynamic> route) => false,
        );
      },
            icon: Icon(Icons.arrow_back, )
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('SUMA', style: TextStyle(fontSize: 70,fontWeight: FontWeight.bold)),
          Image.asset('assets/images/profe.png'),
          Text('3 + 2 + 7= ',
          style: TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 300,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              children: ['5', '12', '9', '17'].map((valor) {
                return ChoiceChip(
                  label: Text(valor, style: TextStyle(fontSize: 20)),
                  selected: _resultadoSeleccionado == valor,
                  onSelected: (bool seleccionado) {
                    setState(() {
                      if (seleccionado) {
                        _resultadoSeleccionado = valor;
                      }
                    });
                  },
                  selectedColor: Colors.amber,
                  backgroundColor: Colors.limeAccent,
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

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NivelSuperado(
                  siguienteNivel: Suma2(),
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
            child: Text('Confirmar', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.black),
            ),
          ),

        ],
      ),

    );
  }
}
