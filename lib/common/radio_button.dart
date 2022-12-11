import 'package:flutter/material.dart';
import 'package:from_css_color/from_css_color.dart';

class RadioButton extends StatelessWidget {
  const RadioButton({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final Locale groupValue;
  final Locale value;
  final ValueChanged<Locale> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value.languageCode != groupValue.languageCode) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child: Radio<Locale>(
                groupValue: groupValue,
                value: value,
                onChanged: (Locale? newValue) => onChanged(newValue!),
              ),
            ),
            Text(label, style: TextStyle(
              color: fromCssColor("#121F3E"),
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),),
          ],
        ),
      ),
    );
  }
}
