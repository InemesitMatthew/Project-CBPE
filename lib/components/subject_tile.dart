import 'package:flutter/material.dart';

class SubjectTile extends StatelessWidget {
  final String subjectName;
  final IconData icon;
  final VoidCallback onTap;

  const SubjectTile({
    super.key,
    required this.subjectName,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 8),
            Text(
              subjectName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
