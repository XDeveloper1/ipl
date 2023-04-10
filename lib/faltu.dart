import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class faltu extends StatefulWidget {
  @override
  faltuState createState() => faltuState();
}

class faltuState extends State<faltu> {
  final databaseRef = FirebaseDatabase.instance.reference().child('items');
  List<ListItem> items = [];

  @override
  void initState() {
    super.initState();

    databaseRef.onChildAdded.listen((event) {
      setState(() {
        items.add(ListItem.fromSnapshot(event.snapshot));
      });
    });

    databaseRef.onChildChanged.listen((event) {
      setState(() {
        int index = items.indexWhere((item) => item.key == event.snapshot.key);
        items[index] = ListItem.fromSnapshot(event.snapshot);
      });
    });
  }

  void addItem() {
    String key = databaseRef.push().key!;
    ListItem newItem = ListItem(key: key, icon: Icons.note, title: 'New Item', subtitle: 'New Subtitle');
    databaseRef.child(key).set(newItem.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(items[index].icon),
            title: TextFormField(
              initialValue: items[index].title,
              onChanged: (value) {
                databaseRef.child(items[index].key).update({'title': value});
              },
            ),
            subtitle: TextFormField(
              initialValue: items[index].subtitle,
              onChanged: (value) {
                databaseRef.child(items[index].key).update({'subtitle': value});
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addItem,
        child: Icon(Icons.add),
      ),
    );
  }
}
class ListItem {
  late String key;
  late IconData icon;
  late String title;
  late String subtitle;

  ListItem({
    required this.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  ListItem.fromSnapshot(DataSnapshot snapshot) {
    // key = snapshot.key!;
    // icon = IconData(snapshot.value.toString() as int, fontFamily: 'MaterialIcons');
    // title = snapshot.value.toString();
    // subtitle = snapshot.value.toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'icon': icon.codePoint,
      'title': title,
      'subtitle': subtitle,
    };
  }
}
