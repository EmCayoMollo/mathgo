import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu//aritmetica/suma1.dart';
import 'package:mathgo/menu/homeMenu.dart';

class NivelesMenu extends StatelessWidget {
  const NivelesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            icon: Icon(Icons.arrow_back, )
        ),
        title: Text('Niveles'
          ,style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold
            )
                  ),
        centerTitle: true,
      ),

      body: Center(
        child: SizedBox(
          height: 500,
          child: ListView(
            children: [
              ListTile(
                title: Container(
                  color: Colors.black12,
                  child: Center(
                    child: Text(
                        'Aritmetica',
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.black26,
                              offset: Offset(3, 3),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                    ),
                  ),
                ),
                onTap: (){
                  Navigator.push(    context,
                    MaterialPageRoute(builder: (context) => const Suma1()),
                  );
                },
              ),
              ListTile(
                title: Container(
                  color: Colors.black12,
                  child: Center(
                    child: Text(
                        'Nivel 2',
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                offset: Offset(3, 3),
                                blurRadius: 2,
                              ),
                            ],
                        )
                    ),
                  ),
                ),
                onTap: (){},
              ),
              ListTile(
                title: Container(
                  color: Colors.black12,
                  child: Center(
                    child: Text(
                        'Nivel 3',
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black26,
                                offset: Offset(3, 3),
                                blurRadius: 2,
                              ),
                            ],
                        )
                    ),
                  ),
                ),
                onTap: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
