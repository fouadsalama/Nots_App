import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'colors_list_view.dart';

class EditColorsListView extends StatefulWidget {
  const EditColorsListView({super.key, required this.notes});
  final NoteModel notes;

  @override
  State<EditColorsListView> createState() => _EditColorsListViewState();
}

class _EditColorsListViewState extends State<EditColorsListView> {
  int currentIndex = 0;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.notes.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2 * 38,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
                widget.notes.color = kColors[index].value;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
