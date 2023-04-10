import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ipl/admin.dart';
import 'package:ipl/faltu.dart';

// import 'faltu.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _currentindex = 0;
  List<MyListItem> items = [
    MyListItem(
      title: 'Item 1',
      description: 'This is item 1',
      image1: 'https://picsum.photos/200/300/?blur=2',
      image2: 'https://picsum.photos/200/300/?blur=2',
      options: ['Option 1', 'Option 2', 'Option 3'],
    ),
    MyListItem(
      title: 'Item 2',
      description: 'This is item 2',
      image1: 'https://picsum.photos/200/300/?blur=2',
      image2: 'https://picsum.photos/200/300/?blur=2',
      options: ['Option 4', 'Option 5'],
    ),
    MyListItem(
      title: 'Item 3',
      description: 'This is item 3',
      image1: 'https://picsum.photos/200/300/?blur=2',
      image2: 'https://picsum.photos/200/300/?blur=2',
      options: ['Option 6'],
    ),
  ];

  late int _selectedCardIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed:(){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) => admin()
                ));
                },
              icon: Icon(Icons.admin_panel_settings))
        ],
        title: Center(
          child: Column(
            children: [
              if (_currentindex == 0)
                Text("CRICKET",
                    style: TextStyle(fontSize: 30, color: Colors.black)),
              if (_currentindex == 1)
                Text("News",
                    style: TextStyle(fontSize: 30, color: Colors.black)),
              if (_currentindex == 2)
                Text("Football",
                    style: TextStyle(fontSize: 30, color: Colors.black)),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          if (_currentindex == 0)
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCardIndex = index;
                      var data = index.toString();
                      print(data);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            data: data,
                          ),
                        ),
                      );
                    });
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(width: 20),
                            ClipOval(
                              child: Image.network(
                                items[index].image1,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            ),
                            SizedBox(width: 25),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    items[index].title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    items[index].description,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 25),
                            ClipOval(

                              child: Image.network(
                                items[index].image2,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          if (_currentindex == 1)
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          items[index].image1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            ExpansionTile(
                              title: Text(items[index].description),
                              children: [
                                AutoSizeText(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          if (_currentindex == 2)
            ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AspectRatio(
                        aspectRatio: 16 / 9,
                        child: Image.network(
                          items[index].image1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8),
                            ExpansionTile(
                              title: Text(items[index].description),
                              children: [
                                AutoSizeText(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentindex,
        onTap: (index) {
          setState(() {
            if (index == 0) {
            } else {
              if (index == 1) {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => News(),
                //   ),
                // );
              } else {
                if (index == 2) {}
              }
            }
            _currentindex = index;
          });
          if (index == 1) {
            print('checkAnswer');
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueAccent,
        selectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_cricket_outlined), label: 'Cricket'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_football_outlined), label: 'football')
        ],
      ),
    );
  }
}

class MyListItem {
  final String title;
  final String description;
  final String image1;
  final String image2;
  final List<String> options;

  MyListItem({
    required this.title,
    required this.description,
    required this.image1,
    required this.image2,
    required this.options,
  });
}

class DetailPage extends StatefulWidget {
  final String data;

  DetailPage({required this.data});

  // const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<Map<String, String>> _data = [
    {
      "title": "Title 1",
      "subtitle": "Subtitle 1",
      "imageUrl": "https://via.placeholder.com/150",
    },
    {
      "title": "Title 2",
      "subtitle": "Subtitle 2",
      "imageUrl": "https://via.placeholder.com/150",
    },
    {
      "title": "Title 3",
      "subtitle": "Subtitle 3",
      "imageUrl": "https://via.placeholder.com/150",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Preview'),
                Tab(text: 'Team'),
              ],
            ),
            title: Text('Cricket'),
          ),
          body: TabBarView(
            children: [
              // content for first tab
              Container(
                padding: EdgeInsets.only(top: 10),
                child: AutoSizeText(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
              ),
              // content for second tab
              ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Icon(Icons.person),
                    title: Text(_data[index]["title"]!),
                    subtitle: Text(_data[index]["subtitle"]!),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void thisis() {
    var data = widget.data;
    print(data);
  }
}
