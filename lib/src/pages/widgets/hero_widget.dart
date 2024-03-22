import 'package:code_hero/src/helpers/configs.dart';
import 'package:code_hero/src/models/hero_list_model.dart';
import 'package:code_hero/src/pages/details/hero_detail.dart';
import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  final int heroId;
  final String imageUrl;
  final String heroName;
  final Result hero;

  const HeroWidget({
    super.key,
    required this.heroId,
    required this.imageUrl,
    required this.heroName,
    required this.hero,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => HeroDetail(hero: hero))),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.5, color: Config.mainColor),
          ),
        ),
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30),
          child: Row(
            children: [
              Hero(
                tag: heroName,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Config.mainColor,
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Text(
                  heroName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
