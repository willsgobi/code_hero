import 'package:code_hero/src/helpers/configs.dart';
import 'package:code_hero/src/pages/widgets/header_widget.dart';
import 'package:code_hero/src/pages/widgets/hero_list.dart';
import 'package:code_hero/src/pages/widgets/pagination.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<int> totalHeros = ValueNotifier<int>(0);
  ValueNotifier<int> currentPage = ValueNotifier<int>(1);
  ValueNotifier<String?> searchName = ValueNotifier<String?>(null);
  TextEditingController searchNameController = TextEditingController();

  @override
  void dispose() {
    totalHeros.dispose();
    currentPage.dispose();
    searchName.dispose();
    searchNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height - 20,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                HeaderWidget(
                  searchName: searchName,
                  searchNameController: searchNameController,
                  resetPages: () {
                    currentPage.value = 1;
                  },
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  color: Config.mainColor,
                  height: 40,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.sizeOf(context).width / 3.2),
                    child: const Text(
                      "Nome",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                ValueListenableBuilder(
                  valueListenable: searchName,
                  builder: (_, __, ___) {
                    return ValueListenableBuilder(
                      valueListenable: currentPage,
                      builder: (_, updatedPage, ___) {
                        return HeroList(
                          totalHeros: (total) => {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              totalHeros.value = total;
                            })
                          },
                          page: updatedPage,
                          searchName: searchName.value,
                        );
                      },
                    );
                  },
                ),
                const Spacer(),
                ValueListenableBuilder(
                    valueListenable: currentPage,
                    builder: (_, __, ___) {
                      return ValueListenableBuilder(
                          valueListenable: totalHeros,
                          builder: (_, __, ___) {
                            if (totalHeros.value > 4) {
                              return Pagination(
                                count: totalHeros.value,
                                currentPage: currentPage,
                                changePage: (int newPage) {
                                  currentPage.value = newPage;
                                },
                              );
                            }

                            return const SizedBox();
                          });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
