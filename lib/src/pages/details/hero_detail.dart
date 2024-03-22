import 'package:code_hero/src/helpers/configs.dart';
import 'package:code_hero/src/models/hero_list_model.dart';
import 'package:code_hero/src/pages/details/widgets/expansion_widget.dart';
import 'package:flutter/material.dart';

class HeroDetail extends StatefulWidget {
  final Result hero;
  const HeroDetail({super.key, required this.hero});

  @override
  State<HeroDetail> createState() => _HeroDetailState();
}

class _HeroDetailState extends State<HeroDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.hero.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Hero(
                    tag: widget.hero.name,
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              offset: const Offset(1, 1),
                              blurRadius: 5,
                              color: Config.mainColor.withOpacity(.4),
                              spreadRadius: 1)
                        ],
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "${widget.hero.thumbnail.path}.${widget.hero.thumbnail.extension}",
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    widget.hero.description.isNotEmpty
                        ? widget.hero.description
                        : "Este herói não possui uma descrição",
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ExpansionWidget(
                      count: widget.hero.series.available,
                      title: "Séries",
                      list: widget.hero.series.items,
                      icon: Icons.book),
                  ExpansionWidget(
                    count: widget.hero.stories.available,
                    title: "Histórias",
                    list: widget.hero.stories.items,
                    icon: Icons.history_edu,
                  ),
                  ExpansionWidget(
                    count: widget.hero.comics.available,
                    title: "Quadrinhos",
                    list: widget.hero.comics.items,
                    icon: Icons.high_quality,
                  ),
                  ExpansionWidget(
                    count: widget.hero.events.available,
                    title: "Séries",
                    list: widget.hero.events.items,
                    icon: Icons.event_available,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
