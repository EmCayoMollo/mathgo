import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu/nivelesMenu.dart';

class Final extends StatefulWidget {
  const Final({super.key});

  @override
  State<Final> createState() => _FinalState();
}

class _FinalState extends State<Final> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop,dynamic result){},
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/fondo.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('FIN',style: TextStyle(fontSize: 100,color: Colors.black,fontWeight: FontWeight.bold),),
                TextButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NivelesMenu()),
                      );
                    },
                    child: Text('Volver a Menu',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.black,
                    )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
