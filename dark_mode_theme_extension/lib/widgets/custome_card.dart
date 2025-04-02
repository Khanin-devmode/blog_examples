import 'package:dark_mode_theme_extension/themes/extension.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String content;
  final IconData icon;

  const CustomCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.content,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = context.designSystemsColors;

    return Card(
      color: colors.background,
      shadowColor: colors.shadow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: colors.border),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: colors.icon),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: colors.title,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(color: colors.subTitle, fontSize: 14),
            ),
            const SizedBox(height: 12),
            Text(
              content,
              style: TextStyle(color: colors.content, fontSize: 16),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: colors.actionButtonBackground,
                ),
                onPressed: () {},
                child: Text(
                  "Action",
                  style: TextStyle(color: colors.actionButtonText),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
