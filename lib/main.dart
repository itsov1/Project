import 'package:flutter/material.dart';
import 'package:ovi/user_input.dart';
import 'calculator.dart'; // Import the file containing the calculator code
import 'weather.dart'; // Import the file containing the weather code
import 'quiz.dart'; // Import the file containing the quiz code
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LAB FINAL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '201-15-3274'),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _displayedInfo = '';

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 4) {
      _navigateToUserInputPage(context);
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CalculatorPage()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const WeatherPage()),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const QuestionBoard()),
      );
    }
  }

  void _navigateToUserInputPage(BuildContext context) async {
    final Map<String, dynamic>? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserInputPage()),
    );
    if (result != null) {
      setState(() {
        _displayedInfo = '''
          Name: ${result['name']}
          Age: ${result['age']}
          Gender: ${result['gender']}
          District: ${result['district']}
          Division: ${result['division']}
          Occupation: ${result['occupation']}
          Education: ${result['education']}
          CGPA: ${result['cgpa']}
        ''';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _getBody(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Calculator',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wb_sunny),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'Input',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey, // Grey color for inactive items
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _getBody(int index) {
    return Center(
      child: _selectedIndex == 0
          ? Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Portfolio Information Display Section',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(_displayedInfo),
            ],
          ),
        ),
      )
          : _widgetOptions.elementAt(index),
    );
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Portfolio Information Display Section'),
    Text('Calculator Section'),
    Text('Weather App Section'),
    Text('Quiz Section'),
    Text('Portfolio Information Input Section'),
  ];
}
