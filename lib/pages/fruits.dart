import 'package:flutter/material.dart';
import '../models/item.dart';
import '../widgets/add_fruit.dart';

class Fruits extends StatefulWidget {
  @override
  _FruitsState createState() => _FruitsState();
}

List<int> position = [0];
int currentLenght;
int fruitsNum = 0;
final List<Item> userItem = [];

class _FruitsState extends State<Fruits> {


  String i;
  final titleController = TextEditingController();

  void addToSpecificFruit(index) {
    print(index);
    setState(() {
      userItem[index].number++;
    });
  }

  void removeFromSpecificFruit(index) {
    print(index);
    setState(() {
      if (userItem[index].number <= 0) {
        userItem[index].number = 0;
      }
      else {
        userItem[index].number--;
      }
    });
  }

  void addNewFruit() {
    currentLenght = position.length;
    setState(() {
      fruitsNum++;
      position.insert(0, currentLenght);
    });

    //Navigator.of(context).pop();
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
          itemCount: userItem.length,
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
                            Row(
                              children: <Widget>[
                                Container(
                                  child: Text(
                                    userItem[index].number.toString(),
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),
                                Container(
                                  child: Text(
                                    userItem[index].title,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(10),
                                ),
                              ],
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
                                  onPressed: () {
                                    addToSpecificFruit(index);
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    removeFromSpecificFruit(index);
                                  },
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
        //onPressed: addNewFruit,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFruit()),);
        },
        tooltip: 'Add a New Fruit',
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
