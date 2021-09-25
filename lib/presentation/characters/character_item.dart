import 'package:flutter/material.dart';
import 'package:proyecto_flutter/domain/domain/character_model.dart';

class Characteritem extends StatelessWidget {
  final CharacterModel character;

  Characteritem({required this.character});

  @override
  Widget build(BuildContext context) {
    return BorderCard(
      onTap: () {},
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildImage(),
          const SizedBox(width: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  character.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      height: 7.0,
                      width: 7.0,
                      decoration: BoxDecoration(
                        color: statusColor(),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      '${character.status} - ${character.species}',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5.0),
                buildInfo('Last known location:', character.origin.name),
                const SizedBox(height: 5.0),
                buildInfo('Origin:', character.location.name),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildImage() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      child: Image.network(
        character.image,
        height: 145.0,
      ),
    );
  }

  buildInfo(title, content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
        Text(
          content,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ],
    );
  }

  Color statusColor() {
    switch (character.status.toLowerCase()) {
      case 'alive':
        return Colors.green;
      case 'dead':
        return Colors.red;
      case 'unknown':
        return Colors.blueGrey;
      default:
        return Colors.blueGrey;
    }
  }
}

class BorderCard extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final BorderRadius borderRadius;
  final bool elevated;

  const BorderCard({
    required this.child,
    required this.onTap,
    required this.borderRadius,
    this.elevated = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: elevated
          ? BoxDecoration(
              borderRadius: borderRadius,
              color: Theme.of(context).cardColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!.withOpacity(0.8),
                  blurRadius: 8.0,
                  spreadRadius: 0.0,
                  offset: const Offset(
                    0.0,
                    2.0,
                  ),
                ),
              ],
            )
          : BoxDecoration(
              borderRadius: borderRadius,
              color: Theme.of(context).cardColor,
            ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: borderRadius,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () {},
          child: child,
        ),
      ),
    );
  }
}
