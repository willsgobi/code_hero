import 'package:code_hero/src/helpers/configs.dart';
import 'package:flutter/material.dart';

class ExpansionWidget extends StatelessWidget {
  final String title;
  final List<dynamic> list;
  final int count;
  final IconData icon;

  const ExpansionWidget(
      {super.key,
      required this.list,
      required this.count,
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    if (count == 0) return const SizedBox();

    return Column(
      children: [
        ExpansionTile(
          title: Text(title),
          leading: Icon(
            icon,
            color: Config.mainColor,
          ),
          children: list
              .map((e) => ListTile(
                    title: Text(e.name),
                  ))
              .toList(),
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
