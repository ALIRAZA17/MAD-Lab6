import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saved Suggestions',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const SavedSuggestionsScreen(),
    );
  }
}

class SavedSuggestionsScreen extends StatefulWidget {
  const SavedSuggestionsScreen({super.key});

  @override
  State<SavedSuggestionsScreen> createState() => _SavedSuggestionsScreenState();
}

class _SavedSuggestionsScreenState extends State<SavedSuggestionsScreen> {
  final List<String> savedSuggestions = [
    "Tiger",
    "Elephant",
    "Lion",
    "Giraffe",
    "Zebra",
    "Monkey",
    "Panda",
    "Kangaroo",
    "Cheetah",
    "Dolphin",
    "Polar Bear",
    "Koala",
    "Rhinoceros",
    "Hippopotamus",
    "Gorilla",
    "Penguin",
    "Jaguar",
    "Sloth",
    "Crocodile",
    "Orangutan",
    "Chimpanzee",
    "Ostrich",
    "Octopus",
    "Bald Eagle",
    "Raccoon",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
        elevation: 2,
      ),
      body: ListView.builder(
        itemCount: savedSuggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(savedSuggestions[index]),
            onTap: () => _showConfirmationDialog(savedSuggestions[index]),
          );
        },
      ),
    );
  }

  Future<void> _showConfirmationDialog(String suggestion) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Suggestion?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Are you sure you want to remove this suggestion: $suggestion?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                setState(() {
                  savedSuggestions.remove(suggestion);
                });
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
