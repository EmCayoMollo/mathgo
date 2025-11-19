import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  final TextEditingController _nameController = TextEditingController();
  final String nombre='';
  final player=AudioPlayer();

  @override
  void dispose() {
    player.dispose();
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
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre',
              ),
              controller: _nameController,
            ),
            IconButton(onPressed: (){
              player.play(AssetSource('music/fly.mp3'));
              player.setReleaseMode(ReleaseMode.loop);
            }, icon: Icon(Icons.play_arrow)),
            SizedBox(width: 20,),
            IconButton(onPressed: (){player.stop();}, icon: Icon(Icons.stop)),
          ],
        ),
      ),
    );
  }
}
