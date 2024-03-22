import 'package:code_hero/src/helpers/configs.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatefulWidget {
  final TextEditingController searchNameController;
  final ValueNotifier<String?> searchName;
  final Function resetPages;
  const HeaderWidget(
      {super.key,
      required this.searchNameController,
      required this.searchName,
      required this.resetPages});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          RichText(
            text: TextSpan(
              text: 'BUSCA MARVEL ',
              style: TextStyle(
                color: Config.mainColor,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                fontSize: 18,
              ),
              children: const [
                TextSpan(
                    text: "TESTE FRONT-END",
                    style: TextStyle(
                        fontFamily: 'Roboto', fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: 60,
            height: 3,
            color: Config.mainColor,
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Nome do Personagem",
            style: TextStyle(
              color: Config.mainColor,
              fontSize: 16,
              fontFamily: 'Roboto',
            ),
          ),
          SizedBox(
              height: 45,
              width: MediaQuery.sizeOf(context).width - 30,
              child: TextField(
                controller: widget.searchNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                textAlignVertical: TextAlignVertical.top,
                onSubmitted: (value) {
                  widget.searchName.value = value;
                  widget.resetPages();
                },
              )),
          ValueListenableBuilder(
              valueListenable: widget.searchName,
              builder: (_, value, __) {
                if (value != null && value.isNotEmpty) {
                  return InkWell(
                    onTap: () {
                      widget.searchNameController.clear();
                      widget.searchName.value = null;
                      widget.resetPages();
                    },
                    child: Text(
                      "Limpar pesquisa",
                      style: TextStyle(
                        color: Config.mainColor,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  );
                }

                return const SizedBox();
              }),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
