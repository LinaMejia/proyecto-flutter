import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/presentation/home/home_provider.dart';

import 'character_item.dart';

class CharacterListPage extends StatelessWidget {
  const CharacterListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (_, snapshot, __) {
      if (snapshot.characters == null) {
        return Center(child: CircularProgressIndicator());
      } else {
        final result = snapshot.characters!;
        return ListView.builder(
          itemCount: result.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 20.0,
              ),
              child: Characteritem(character: result[index]),
            );
          },
        );
      }
    });
  }
}
