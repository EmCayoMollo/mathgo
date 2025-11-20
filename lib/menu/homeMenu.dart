import 'package:flutter/material.dart';
import 'package:mathgo/menu/config.dart';
import 'package:mathgo/nivelesMenu//nivelesMenu.dart';
import 'package:flutter/services.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          //image: Image.asset('assets/images/fondo.png').image,
          image: AssetImage('assets/images/fondo.png'),
          fit: BoxFit.cover,
        )
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
              Expanded(child: Image.asset('assets/images/logomejorado.png')),
              TextButton.icon(
                icon: const Icon(Icons.play_circle_fill, size: 40),
                label: const Text(
                  'Jugar  ',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith((states)=>Colors.green),
                  foregroundColor: WidgetStateColor.resolveWith((states)=>Colors.black),
                  side: WidgetStatePropertyAll(const BorderSide(color: Colors.black)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  elevation: WidgetStatePropertyAll(8.0),
                  shadowColor: WidgetStatePropertyAll(Colors.black),
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
                  'Configurar  ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith((states)=>Colors.orangeAccent),
                  foregroundColor: WidgetStateColor.resolveWith((states)=>Colors.black),
                  side: WidgetStatePropertyAll(const BorderSide(color: Colors.black)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  elevation: WidgetStatePropertyAll(8.0),
                  shadowColor: WidgetStatePropertyAll(Colors.black),
                ),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Config()),
                  );
                },
              ),
              const SizedBox(height: 20,),
              TextButton.icon(
                icon: const Icon(Icons.cancel, size: 40),
                label: const Text(
                  'Salir  ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: WidgetStateColor.resolveWith((states)=>Colors.red),
                  foregroundColor: WidgetStateColor.resolveWith((states)=>Colors.black),
                  side: WidgetStatePropertyAll(const BorderSide(color: Colors.black)),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
                  elevation: WidgetStatePropertyAll(8.0),
                  shadowColor: WidgetStatePropertyAll(Colors.black),
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
            'assets/images/pie2.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),

    );
  }
}
