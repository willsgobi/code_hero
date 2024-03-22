import 'package:code_hero/src/helpers/configs.dart';
import 'package:code_hero/src/models/hero_list_model.dart';
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
                  ExpansionTile(
                    title: const Text("Séries"),
                    leading: Icon(
                      Icons.book,
                      color: Config.mainColor,
                    ),
                    children: widget.hero.series.items
                        .map((e) => ListTile(
                              title: Text(e.name),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ExpansionTile(
                    title: const Text("Histórias"),
                    leading: Icon(
                      Icons.history_edu,
                      color: Config.mainColor,
                    ),
                    children: widget.hero.stories.items
                        .map((e) => ListTile(
                              title: Text(e.name),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ExpansionTile(
                    title: const Text("Quadrinhos"),
                    leading: Icon(
                      Icons.high_quality,
                      color: Config.mainColor,
                    ),
                    children: widget.hero.comics.items
                        .map((e) => ListTile(
                              title: Text(e.name),
                            ))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  widget.hero.events.available > 0
                      ? ExpansionTile(
                          title: const Text("Eventos"),
                          leading: Icon(
                            Icons.event_available,
                            color: Config.mainColor,
                          ),
                          children: widget.hero.events.items
                              .map((e) => ListTile(
                                    title: Text(e.name),
                                  ))
                              .toList(),
                        )
                      : const SizedBox(),
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
