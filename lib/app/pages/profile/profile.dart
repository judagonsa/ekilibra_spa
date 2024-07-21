import 'package:ekilibra_spa/app/pages/profile/widgets/text_field_box.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi perfil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: const Column(
        children: [Text('Hola mundo'), Textfieldbox()],
      ),
    );
  }
}
