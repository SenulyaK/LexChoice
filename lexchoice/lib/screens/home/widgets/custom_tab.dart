import 'package:flutter/material.dart';
import 'package:lexchoice/utils/constants/colors.dart';

class CustomTab extends StatelessWidget {
  final int selected;
  final Function callback;
  CustomTab(this.selected, this.callback, {Key? key}) : super(key: key);
  final tabs = ['All Stories', 'Recently Played'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final darkMode = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: darkMode
            ? const Color(0xFF121335)
            : const Color(
                0xFFE1E1E1), // Dark mode or light mode background color
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: 56, // Box Decoration
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () => callback(index),
          child: Container(
            decoration: BoxDecoration(
              color: selected == index
                  ? LCColors.primary
                  : darkMode
                      ? const Color(0xFF121335) // Dark mode inactive tab color
                      : const Color(
                          0xFFE1E1E1), // Light mode inactive tab color
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            width: (width - 40) / 2 - 10,
            child: Text(
              tabs[index],
              style: TextStyle(
                fontSize: 16,
                color: darkMode
                    ? Colors.white
                    : Colors.black, // Text color based on theme
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemCount: tabs.length,
      ),
    );
  }
}
