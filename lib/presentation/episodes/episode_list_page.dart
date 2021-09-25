import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto_flutter/presentation/home/home_provider.dart';

class EpisodeListPage extends StatelessWidget {
  const EpisodeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
        builder: (_, snapshot, __) {
          if (snapshot.episodes == null) {
            return Center(child: CircularProgressIndicator());
          }else{
            final result = snapshot.episodes!;
            return ListView.builder(
              itemCount: result.length,
              itemBuilder: (_, index) {
                return ListTile(
                  title: Text(result[index].name),
                  subtitle: Text(result[index].airDate),
                  trailing: Text('Characters ${result[index].characters.length}'),
                );
              },
            );
          }
        }
    );
  }
}