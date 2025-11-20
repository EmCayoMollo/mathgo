import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  final TextEditingController _nameController = TextEditingController();
  String nombre = '';
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _cargarNombre();
  }

  Future<void> _cargarNombre() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nombre = prefs.getString('nombreUsuario') ?? '';
      _nameController.text = nombre;
    });
  }

  Future<void> _guardarNombre(String valor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nombreUsuario', valor);
  }

  @override
  void dispose() {
    player.dispose();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("Configurar"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
                labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
              ),
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30),
              textAlign: TextAlign.center,
              controller: _nameController,
              onChanged: (texto) {
                setState(() {
                  nombre = texto;
                });
                _guardarNombre(texto);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Play                ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                IconButton(
                    onPressed: () {
                      player.play(AssetSource('music/fly.mp3'));
                      player.setReleaseMode(ReleaseMode.loop);
                    },
                    icon: const Icon(Icons.play_arrow)),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Stop                 ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                IconButton(
                    onPressed: () {
                      player.stop();
                    },
                    icon: const Icon(Icons.stop)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
