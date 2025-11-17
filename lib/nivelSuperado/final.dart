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
        body: Column(
          children: [
            Text('fin',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
            TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NivelesMenu()));
                },
                child: Text('volver',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),))
          ],
        ),
      ),
    );
  }
}
