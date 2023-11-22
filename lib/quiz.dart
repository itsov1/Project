import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: QuestionBoard(),
  ));
}

class QuestionBoard extends StatefulWidget {
  const QuestionBoard({Key? key}) : super(key: key);

  @override
  _QuestionBoardState createState() => _QuestionBoardState();
}

class _QuestionBoardState extends State<QuestionBoard> {
  int _selectedAnswerIndex = -1; // Initially no answer selected

  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is the capital of France?',
      'answers': ['Paris', 'London', 'Berlin', 'Madrid'],
      'correctIndex': 0,
    },
    {
      'question': 'Which planet is known as the Red Planet?',
      'answers': ['Venus', 'Mars', 'Jupiter', 'Saturn'],
      'correctIndex': 1,
    },
    // Add more questions here
  ];

  void _selectAnswer(int? index) {
    setState(() {
      _selectedAnswerIndex = index ?? -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Board'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              _questions[_selectedAnswerIndex]['question'],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: List.generate(
              _questions[_selectedAnswerIndex]['answers'].length,
                  (index) {
                return RadioListTile<int>(
                  title: Text(
                    _questions[_selectedAnswerIndex]['answers'][index],
                  ),
                  value: index,
                  groupValue: _selectedAnswerIndex,
                  onChanged: (int? value) {
                    _selectAnswer(value);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Check the selected answer
              int correctIndex = _questions[_selectedAnswerIndex]['correctIndex'];
              if (_selectedAnswerIndex == correctIndex) {
                // Handle correct answer logic here
                print('Correct Answer!');
              } else {
                // Handle incorrect answer logic here
                print('Incorrect Answer!');
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
