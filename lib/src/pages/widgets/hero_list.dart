import 'package:code_hero/src/helpers/configs.dart';
import 'package:code_hero/src/models/hero_list_model.dart';
import 'package:code_hero/src/pages/widgets/hero_widget.dart';
import 'package:code_hero/src/repository/get_heros.dart';
import 'package:flutter/material.dart';

class HeroList extends StatefulWidget {
  final int page;
  final String? searchName;
  final Function(int total) totalHeros;

  const HeroList(
      {super.key,
      required this.page,
      required this.totalHeros,
      this.searchName});

  @override
  State<HeroList> createState() => _HeroListState();
}

class _HeroListState extends State<HeroList> {
  Future<Heros?> getHeros() async {
    try {
      Repository repository = Repository();
      var herosData = await repository.getHeros(widget.page, widget.searchName);
      return herosData;
    } catch (error) {
      print(error);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: FutureBuilder(
        future: getHeros(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Config.mainColor),
            ));
          }

          if (snapshot.hasError) {
            return const Center(
                child: Text("Não foi possível obter os dados de heróis"));
          }

          if (snapshot.hasData) {
            var heros = snapshot.data as Heros;
            widget.totalHeros(heros.data.total);

            if (heros.data.total == 0) {
              return const Center(
                child:
                    Text("Não encontramos nenhum herói com este nome na API."),
              );
            }

            return Column(
              children: heros.data.results
                  .map((e) => HeroWidget(
                        heroId: e.id,
                        imageUrl:
                            "${e.thumbnail.path}.${e.thumbnail.extension}",
                        heroName: e.name,
                        hero: e,
                      ))
                  .toList(),
            );
          }

          return const Center(
              child: Text("Ocorreu um erro ao buscar os dados da API."));
        }),
      ),
    );
  }
}
