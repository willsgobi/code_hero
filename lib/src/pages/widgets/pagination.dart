import 'package:code_hero/src/helpers/configs.dart';
import 'package:flutter/material.dart';

class Pagination extends StatefulWidget {
  final int count;
  final ValueNotifier currentPage;
  final Function(int newPage) changePage;
  const Pagination(
      {super.key,
      required this.count,
      required this.changePage,
      required this.currentPage});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  int currentPage = 1;
  ValueNotifier<List<int>> pagesList = ValueNotifier([1, 2, 3]);
  ValueNotifier<int> pages = ValueNotifier<int>(0);

  getTotalPages() {
    const int itemsPerPage = 4;
    final double totalPages = (widget.count / itemsPerPage).ceilToDouble();
    pages.value = totalPages.toInt();

    if (totalPages == 2) {
      pagesList.value = [1, 2];
    } else if (currentPage == 1) {
      pagesList.value = [1, 2, 3];
    }
  }

  changePage(int clickedPage) {
    getTotalPages();
    if (clickedPage > pages.value) return;

    setState(() {
      currentPage = clickedPage;
    });

    List<int> newListPage;

    if (pages.value == 2) {
      newListPage = [1, 2];
    } else if (clickedPage != 1 && clickedPage < pages.value) {
      newListPage = [clickedPage - 1, clickedPage, clickedPage + 1];
    } else if (clickedPage == pages.value) {
      newListPage = [clickedPage - 2, clickedPage - 1, clickedPage];
    } else {
      newListPage = [1, 2, 3];
    }
    pagesList.value = newListPage;

    widget.changePage(clickedPage);
  }

  @override
  void initState() {
    super.initState();

    getTotalPages();

    widget.currentPage.addListener(() {
      changePage(widget.currentPage.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    getTotalPages();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: currentPage == 1
                  ? null
                  : () {
                      changePage(currentPage - 1);
                    },
              icon: Icon(
                Icons.arrow_left,
                size: 60,
                color: Config.mainColor,
              ),
            ),
            ValueListenableBuilder(
                valueListenable: pagesList,
                builder: (_, __, ___) {
                  if (pages.value > 0) {
                    return Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pagesList.value
                            .map(
                              (e) => InkWell(
                                onTap: () {
                                  changePage(e);
                                },
                                child: Container(
                                  width: 40.0,
                                  height: 40.0,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: e == currentPage
                                          ? Config.mainColor
                                          : Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0)),
                                      border: Border.all(
                                          color: Config.mainColor, width: 2)),
                                  child: Text(
                                    "$e",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.bold,
                                        color: e != currentPage
                                            ? Config.mainColor
                                            : Colors.white),
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    );
                  }

                  return const SizedBox();
                }),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: currentPage == pages.value
                  ? null
                  : () {
                      changePage(currentPage + 1);
                    },
              icon: Icon(
                Icons.arrow_right,
                size: 60,
                color: Config.mainColor,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          color: Config.mainColor,
          width: MediaQuery.sizeOf(context).width,
          height: 20,
        )
      ],
    );
  }
}
