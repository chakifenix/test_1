import 'package:flutter/material.dart';

void main() {
  runApp(Test());
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('TextField Example'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: MyTextField(),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatefulWidget {
  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'sdfds',
        labelText: 'asdsad',
        prefixIcon: Icon(Icons.person),
        contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      onChanged: (value) {
        // Добавьте ваш код обработки изменения текста
      },
      onTap: () {
        setState(() {
          isFocused = true;
        });
      },
      onSubmitted: (value) {
        setState(() {
          isFocused = false;
        });
      },
      // Другие свойства TextField
    );
  }
}
