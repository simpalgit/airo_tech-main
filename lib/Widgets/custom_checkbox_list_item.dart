import 'package:airo_tech/Screens/MyComplains/ComplainDetail/helper_models.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckBoxListItem extends StatelessWidget {
  final ReciprocatingModel item;
  final void Function(bool?) onCheckboxChanged;
  final bool trailingCheckbox;
  final int? index;

  const CustomCheckBoxListItem({
    super.key,
    required this.item,
    required this.onCheckboxChanged,
    this.trailingCheckbox = false,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCheckboxChanged(!item.isSelected);
      },
      child: Row(
        children: [
          if (!trailingCheckbox)
            Checkbox(
              value: item.isSelected,
              onChanged: onCheckboxChanged,
            ),
          Expanded(
            child: Text(
              index != null ? "${index! + 1}. ${item.title}" : item.title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
          if (trailingCheckbox)
            Checkbox(
              value: item.isSelected,
              onChanged: onCheckboxChanged,
            ),
        ],
      ),
    );
  }
}
