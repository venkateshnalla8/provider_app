// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:provider_app/model/item.dart';
// import 'package:provider_app/model/item_data.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ItemData(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(primarySwatch: Colors.green),
//         home: Home(),
//       ),
//     );
//   }
// }
//
// class Home extends StatelessWidget {
//   final TextEditingController _textEditingController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _textEditingController,
//               decoration: InputDecoration(labelText: 'Enter Text'),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // You can handle the submit action here
//                 String enteredText = _textEditingController.text;
//                 // Do something with the entered text, e.g., add it to the ItemData provider
//                 Provider.of<ItemData>(context, listen: true).addItem(enteredText as Item);
//                 _textEditingController.clear(); // Clear the text field
//               },
//               child: Text('Submit'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/model/item_data.dart';

import 'itemlist.dart';
import 'model/item.dart';
import 'model/item_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String newItem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value) {
              setState(() {
                newItem = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Enter Item',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (newItem.isNotEmpty) {
                Provider.of<ItemData>(context, listen: false)
                    .addItem(Item(item: newItem));
                setState(() {
                  newItem = '';
                });
              }
            },
            child: Text('Submit'),
          ),
          Expanded(
            child: ItemList(),
          ),
        ],
      ),
    );
  }
}

