import 'package:flutter/material.dart';

class RowItem extends StatelessWidget {
  // The fields have to be final because StatelessWidgets are immutable.
  // The only way to change the content is by destroying/recreating the whole widget.
  final String text;
  final IconData icon;

  const RowItem({
    Key? key,
    // Using [required] keyword allows us to know the parameter name and make it non nullable.
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      // the decoration allows us to customize our container
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      // We add padding to our row for extra space around it.
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 32,
            ),
            const SizedBox(width: 8),
            // This tells the Text to use the maximum space possible.
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
