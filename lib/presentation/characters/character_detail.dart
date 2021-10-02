import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';

class CharacterDetail extends StatelessWidget {
  // final CharacterModel character;
  // CharacterDetail({required this.character});

  const CharacterDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.of(context)!.settings.arguments);
    final CharacterModel character = ModalRoute.of(context)!.settings.arguments as CharacterModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: _body(character),
    );
  }

  _body(CharacterModel character) {
    String character_image = '';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("name: ${character.name}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Status: ${character.status}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Species: ${character.species}"),
        ),
      ],
    );
  }

  _bocdy() {
    String character_image = '';
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 18, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
        character_image == ''
            ? Image(
                image: AssetImage('assets/no-image.jpg'),
              )
            : FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: NetworkImage(
                    'https://www.latercera.com/resizer/BaNHXVW24tLkG2DTrioBtuWyCxA=/900x600/smart/arc-anglerfish-arc2-prod-copesa.s3.amazonaws.com/public/WPNKFC3FPBBJ3NJK5PINB2XPUM.png')),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Text("Status: ${article.author}")
              Text("Status: Alive"),
              Text("type: Alive"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("name: Rick Sanchez"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Descripción: "),
        )
      ],
    );
  }
}
