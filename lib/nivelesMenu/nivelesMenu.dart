import 'package:flutter/material.dart';
import 'package:mathgo/menu/homeMenu.dart';
import 'package:mathgo/nivelesMenu/algebra/algebraMenu.dart';
import 'package:mathgo/nivelesMenu/aritmetica/aritmeticaMenu.dart';
import 'package:mathgo/nivelesMenu/fracciones/fraccionesmenu.dart';

class NivelesMenu extends StatelessWidget {
  const NivelesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeMenu()),
              (Route<dynamic> route) => false,
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeMenu()),
                  (Route<dynamic> route) => false,
            );
          },
              icon: const Icon(Icons.arrow_back, )
          ),
          title: const Text('Elige tu Nivel'
            ,style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold
              )
                    ),
          centerTitle: true,
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                label: const Text(
                  '   + - × ÷   ',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith((states)=>(Colors.deepOrange)),
                  foregroundColor: WidgetStateColor.resolveWith((states)=>(Colors.black)),
                  side: const WidgetStatePropertyAll(BorderSide(color: Colors.black)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                  ),
                  elevation: WidgetStatePropertyAll(8),
                  shadowColor: WidgetStatePropertyAll(Colors.black),
                ),
                onPressed: (){
                  Navigator.push(    context,
                    MaterialPageRoute(builder: (context) => const AritmeticaMenu()),
                  );
                },
              ),
              const SizedBox(height: 20,),
              TextButton.icon(
                label: const Text(
                    '  Fracciones  ',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                    )
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith((states)=>(Colors.deepOrange)),
                  foregroundColor: WidgetStateColor.resolveWith((states)=>(Colors.black)),
                  side: WidgetStatePropertyAll(const BorderSide(color: Colors.black)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )
                  ),
                  elevation: WidgetStatePropertyAll(8.0),
                  shadowColor: WidgetStatePropertyAll(Colors.black),
                ),
                onPressed: (){
                  Navigator.push(    context,
                    MaterialPageRoute(builder: (context) => const FraccionesMenu()),
                  );
                },
              ),
              const SizedBox(height: 20,),
              TextButton.icon(
                label: const Text(
                    '  Algebra  ',
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                    ),
                ),
                style: ButtonStyle(
                    backgroundColor: WidgetStateColor.resolveWith((states)=>(Colors.deepOrange)),
                    foregroundColor: WidgetStateColor.resolveWith((states)=>(Colors.black)),
                    side: WidgetStatePropertyAll(const BorderSide(color: Colors.black)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                    ),
                    ),
                onPressed: (){
                  Navigator.push(    context,
                    MaterialPageRoute(builder: (context) => const AlgebraMenu()),
                  );
                },
              )

            ]
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          elevation: 0,
          height: 170,
          padding: EdgeInsets.zero,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
