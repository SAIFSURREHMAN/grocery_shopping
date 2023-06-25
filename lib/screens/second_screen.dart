import 'package:flutter/material.dart';

class GroceryHomePage extends StatefulWidget {
  GroceryHomePage({super.key});

  @override
  State<GroceryHomePage> createState() => _GroceryHomePageState();
}

class _GroceryHomePageState extends State<GroceryHomePage> {
  final List<String> groceryItems = [
    'Apples',
    'Bananas',
    'Bread',
    'Milk',
    'Eggs',
    'Cheese',
    'Tomatoes',
    'Potatoes',
    'Onions',
    'Chicken',
  ];

  final List<String> groceryItemsImage = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/7.jpg',
    'assets/8.jpg',
    'assets/9.jpg',
    'assets/10.jpg'
  ];

  List<int> itemQuantities = List<int>.filled(10, 0);

  void incrementItem(int index) {
    setState(() {
      itemQuantities[index]++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 89, 116, 138),
      appBar: AppBar(
        title: Text(
          'Grocery App',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: const Color.fromARGB(255, 118, 138, 155),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
        ),
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // Perform action when item is tapped
              print('You tapped: ${groceryItems[index]}');
            },
            child: Card(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      groceryItems[index],
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Padding(padding: EdgeInsets.only(bottom: 10)),
                    Image.asset(
                      groceryItemsImage[index],
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                    if (itemQuantities[index] == 0)
                      IconButton(
                        onPressed: () {
                          incrementItem(index);
                        },
                        icon: Icon(Icons.shopping_bag),
                      ),
                    if (itemQuantities[index] > 0)
                      ListTile(
                        leading: IconButton(
                          onPressed: () {
                            if (itemQuantities[index] > 0) {
                              setState(() {
                                itemQuantities[index]--;
                              });
                            }
                          },
                          icon: Icon(Icons.remove_circle),
                        ),
                        title: Center(
                          child: Text(
                            itemQuantities[index].toString(),
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            incrementItem(index);
                          },
                          icon: Icon(Icons.add_circle),
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
