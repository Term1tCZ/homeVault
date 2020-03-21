import 'package:flutter/material.dart';
import '../models/item.dart';


class Fruits extends StatefulWidget {
  final List<Item> items;

  Fruits(this.items);

  @override
  _FruitsState createState() => _FruitsState();
}

class _FruitsState extends State<Fruits> {
  int fruitsNum = 0;

  void addNewFruit() {
    setState(() {
      fruitsNum++;
    });

    print(fruitsNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fruits"),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        child: ListView.builder(
          itemCount: fruitsNum,
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 5,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                '3 Apples',
                                style: TextStyle(fontSize: 16),
                              ),
                              padding: EdgeInsets.all(10),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addNewFruit,
        tooltip: 'Add a New Fruit',
        backgroundColor: Colors.blue,
      ),
    );
  }
}
