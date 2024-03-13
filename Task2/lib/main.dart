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

  List<bool> isSelected = List.generate(25, (_) => false);

  bool anyItemSelected() {
    return isSelected.contains(true);
  }

  void deleteSelectedItems() {
    setState(() {
      for (int i = savedSuggestions.length - 1; i >= 0; i--) {
        if (isSelected[i]) {
          savedSuggestions.removeAt(i);
          isSelected.removeAt(i);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              if (anyItemSelected()) {
                _showConfirmationDialog();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No Item Selected'),
                  ),
                );
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: savedSuggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(savedSuggestions[index]),
            trailing: isSelected[index]
                ? const Icon(Icons.check_circle, color: Colors.green)
                : null,
            onTap: () {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
          );
        },
      ),
    );
  }

  Future<void> _showConfirmationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Selected Items?'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete the selected items?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Yes'),
              onPressed: () {
                deleteSelectedItems();
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
