import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mathgo/nivelesMenu//nivelesMenu.dart';
import 'package:flutter/services.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/pizarron4.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.info),
                  color: Colors.white,
                  iconSize: 50,
                  onPressed: () {}
              ),

              IconButton(
                  icon: Icon(Icons.account_box),
                  color: Colors.white,
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
              Image.asset('assets/images/logo.png'),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF00be7a)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),

                  )),
                ),
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const NivelesMenu()),
                  );
                },
                child: Text(
                  'Jugar',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF00be7a)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                ),
                onPressed: (){},
                child: Text(
                  'Configurar',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(const Color(0xFF00be7a)),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                   ),
                  ),
                ),
                onPressed: (){
                  SystemNavigator.pop();
                },
                child: Text(
                  'Salir',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Inicio',
            ),

          ],
        ),
      ),
    );
  }
}
