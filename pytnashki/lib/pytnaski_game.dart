import 'package:flutter/material.dart';

import 'game.dart';

class PyatnaskiGame extends StatelessWidget {
  const PyatnaskiGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Game(),
    );
  }
}
