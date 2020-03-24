import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/item.dart';
import '../pages/fruits.dart';

class AddFruit extends StatefulWidget {
  @override
  _AddFruitState createState() => _AddFruitState();
}

class _AddFruitState extends State<AddFruit> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  //final List<Item> _userItem = [];

  void addNewFruit() {
    currentLenght = position.length;
    final newTx = Item(
      title: _nameController.text,
      number: int.parse(_numberController.text),
      id: DateTime.now().toString(),
    );

    setState(() {
      userItem.add(newTx);
      print(userItem);
      fruitsNum++;
      position.insert(0, currentLenght);
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruits"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(labelText: 'Name'),
                      controller: _nameController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'),
                      controller: _numberController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            icon: Icon(Icons.add),
            label: Text('Add a new Fruit'),
            onPressed: addNewFruit,
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
