import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';
import '../controller/home_page_controller.dart';

class DrawerTile extends StatelessWidget {
  final HomePageController select;
  final int index;
  const DrawerTile({super.key, required this.select, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        select.setSelected(index);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.only(
            top: 8, bottom: 8, right: MediaQuery.of(context).size.width * 0.02),
        width: double.infinity,
        decoration: BoxDecoration(
          color: select.currentSelect.index == index
              ? Colors.white
              : Colors.transparent,
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
        ),
        child: Row(
          children: [
            Icon(select.widgets[index].icons,
                color: select.currentSelect.index == index
                    ? Theme.of(context).primaryColor
                    : Colors.white,
                size: 25),
            const SizedBox(width: 5),
            Expanded(
                child: TEXT(
                    text: select.widgets[index].title,
                    size: 18,
                    bold: select.currentSelect.index == index,
                    color: select.currentSelect.index == index
                        ? Theme.of(context).primaryColor
                        : Colors.white))
          ],
        ),
      ),
    );
  }
}
