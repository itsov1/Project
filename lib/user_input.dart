import 'package:flutter/material.dart';

class UserInputPage extends StatefulWidget {
  const UserInputPage({Key? key}) : super(key: key);

  @override
  _UserInputPageState createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  // Variables to store user input
  String _name = '';
  int _age = 0;
  String _gender = '';
  String _district = '';
  String _division = '';
  String _occupation = '';
  String _education = '';
  double _cgpa = 0.0;

  bool _isOverflow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                onChanged: (value) => _name = value,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                onChanged: (value) => _age = int.tryParse(value) ?? 0,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                onChanged: (value) => _gender = value,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextField(
                onChanged: (value) => _district = value,
                decoration: InputDecoration(labelText: 'District'),
              ),
              TextField(
                onChanged: (value) => _division = value,
                decoration: InputDecoration(labelText: 'Division'),
              ),
              TextField(
                onChanged: (value) => _occupation = value,
                decoration: InputDecoration(labelText: 'Occupation'),
              ),
              TextField(
                onChanged: (value) => _education = value,
                decoration: InputDecoration(labelText: 'Education'),
              ),
              TextField(
                onChanged: (value) => _cgpa = double.tryParse(value) ?? 0.0,
                decoration: InputDecoration(labelText: 'CGPA'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              ElevatedButton(
                onPressed: () {
                  // Submit button functionality
                  // Here, you can use Navigator.pop to return the entered data to the previous screen
                  Navigator.pop(context, {
                    'name': _name,
                    'age': _age,
                    'gender': _gender,
                    'district': _district,
                    'division': _division,
                    'occupation': _occupation,
                    'education': _education,
                    'cgpa': _cgpa,
                  });
                },
                child: const Text('Submit'),
              ),
              if (_isOverflow)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  // child: Text(
                  //   'Bottom overflowed by 160 pixels',
                  //   style: TextStyle(color: Colors.red),
                  // ),
                ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      // Set resizeToAvoidBottomInset to true to handle keyboard overlap
    );
  }

  @override
  void initState() {
    super.initState();
    // Listen for keyboard status changes
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _checkOverflow();
    });
    // You may also need to listen for MediaQuery changes to handle keyboard status changes
    // MediaQuery.of(context).viewInsets.bottom;
  }

  void _checkOverflow() {
    final RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final screenSize = MediaQuery.of(context).size;
    final bottomInset = screenSize.height - size.height;
    if (bottomInset < 160) {
      setState(() {
        _isOverflow = true;
      });
    }
  }
}
