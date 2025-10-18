import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu//nivelesMenu.dart';
import 'package:flutter/services.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Row(
          children: [
            IconButton(
                icon: const Icon(Icons.info),
                color: Colors.black,
                iconSize: 50,
                onPressed: () {}
            ),
          ],
        ),
        leadingWidth: 500,
      ),
      body:Center(
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Image.asset('assets/images/logomejorado.png'),
            TextButton.icon(
              icon: const Icon(Icons.play_circle_fill, size: 40),
              label: const Text(
                'Jugar',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(20),
                                                                        )
                                                  ),
                elevation: MaterialStateProperty.all(8.0),
                shadowColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NivelesMenu()),
                );
              },
            ),
            const SizedBox(height: 20,),
            TextButton.icon(
              icon: const Icon(Icons.settings, size: 40),
              label: const Text(
                'Configurar',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                elevation: MaterialStateProperty.all(8.0),
                shadowColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: (){},
            ),
            const SizedBox(height: 20,),
            TextButton.icon(
              icon: const Icon(Icons.cancel, size: 40),
              label: const Text(
                'Salir',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                foregroundColor: MaterialStateProperty.all(Colors.black),
                side: MaterialStateProperty.all(const BorderSide(color: Colors.black)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                )),
                elevation: MaterialStateProperty.all(8.0),
                shadowColor: MaterialStateProperty.all(Colors.black),
              ),
              onPressed: (){
                SystemNavigator.pop();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        height: 170,
        padding: EdgeInsets.zero,
        child: Image.asset(
          'assets/images/pieP.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
