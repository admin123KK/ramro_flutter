import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({super.key});

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  List<String> _items = ['Pizza'];
  final TextEditingController _textEditingController = TextEditingController();
  late SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    _prefs = await SharedPreferences.getInstance();
    final items = _prefs.getStringList('items');
    setState(() {
      _items = items ?? [];
    });
  }

  Future<void> _saveItems() async {
    await _prefs.setStringList('items', _items);
  }

  void _addNewItem(String title) {
    setState(() {
      _items.add(title);
    });
    _textEditingController.clear();
    _saveItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
      ),
      body: WillPopScope(
        onWillPop: () async {
          await _saveItems();
          return true;
        },
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(9),
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(_items[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Update Items'),
                                        content: TextField(
                                          controller: TextEditingController(
                                              text: _items[index]),
                                          onChanged: (value) {
                                            _items[index] = value;
                                          },
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: const Text('Save'),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _items.removeAt(index);
                                });
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                decoration: InputDecoration(hintText: 'Add new items'),
                onSubmitted: (value) {
                  _addNewItem(value);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
