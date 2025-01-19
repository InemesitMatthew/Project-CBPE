import 'package:flutter/material.dart';
import '../components/my_drawer.dart';
import '../components/subject_tile.dart';
import 'quiz_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CBPE'),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            SubjectTile(
              subjectName: 'Maths',
              icon: Icons.calculate_outlined,
              onTap: () {
                // Navigate to QuizPage with 'Maths' as the subject name
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizPage(subjectName: 'Maths'),
                  ),
                );
              },
            ),
            
            SubjectTile(
              subjectName: 'Physics',
              icon: Icons.science_outlined,
              onTap: () {
                // Navigate to QuizPage with 'Physics' as the subject name
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizPage(
                      subjectName: 'Physics',
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
