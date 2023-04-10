import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';

class admin extends StatefulWidget {
  const admin({Key? key}) : super(key: key);

  @override
  State<admin> createState() => _adminState();
}

class _adminState extends State<admin> {
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
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const admin()));
              },
              icon: const Icon(Icons.admin_panel_settings))
        ],
        title: Center(
          child: Column(
            children: [
              if (_currentindex == 0)
                const Text("CRICKET Admin",
                    style: TextStyle(fontSize: 30, color: Colors.black)),
              if (_currentindex == 1)
                const Text("News Admin",
                    style: TextStyle(fontSize: 30, color: Colors.black)),
              if (_currentindex == 2)
                const Text("Football Admin",
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
                            const SizedBox(width: 20),
                            ClipOval(
                              child: Image.network(
                                items[index].image1,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                            ),
                            const SizedBox(width: 25),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    items[index].title,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Text(
                                    items[index].description,
                                    style: const TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(width: 25),
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
                            const SizedBox(height: 8),
                            ExpansionTile(
                              title: Text(items[index].description),
                              children: [
                                const AutoSizeText(
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
                            const SizedBox(height: 8),
                            ExpansionTile(
                              title: Text(items[index].description),
                              children: [
                                const AutoSizeText(
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
  File? _file1;
  bool _uploading1 = false;
  File? _file2;
  bool _uploading2 = false;
  var key1;

  Future pickFile1() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        // _file1 = File("image1  Selected");
        _file1 = File(result.files.single.path.toString());
      });
    }
  }

  Future pickFile2() async {
    final result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        // _file2 = File("image2  Selected");
        _file2 = File(result.files.single.path.toString());
      });
    }
  }

  Future uploadFile1() async {
    setState(() {
      _uploading1 = true;
    });

    // Upload the file to Firebase Storage  file 1
    final Reference storageReference1 = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final UploadTask uploadTask1 = storageReference1.putFile(_file1!);
    final TaskSnapshot downloadUrl1 = (await uploadTask1);

    // Get the file URL
    final String url1 = await downloadUrl1.ref.getDownloadURL();

    // Save the URL to the Realtime Database
    final DatabaseReference ref1 =
        FirebaseDatabase.instance.reference().child('files');
    key1 = ref1.push().key;
    if (key1 != null) {
      await ref1.child(key1).child("image1").set({'url1': url1}).whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Image Uploaded sucess'))));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('please select image 1')));
    }

    // Upload the file to Firebase Storage  file 2

    setState(() {
      _uploading1 = false;
    });
  }

  Future uploadFile2() async {
    setState(() {
      _uploading2 = true;
    });
    final Reference storageReference2 = FirebaseStorage.instance
        .ref()
        .child('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
    final UploadTask uploadTask2 = storageReference2.putFile(_file2!);
    final TaskSnapshot downloadUrl2 = (await uploadTask2);

    // Get the file URL
    final String url2 = await downloadUrl2.ref.getDownloadURL();

    // Save the URL to the Realtime Database
    final DatabaseReference ref2 =
        FirebaseDatabase.instance.reference().child('files');
    // final String? key2 = ref2.push().key;
    if (key1 != null) {
      await ref2.child(key1).child("image2").set({'url2': url2}).whenComplete(
          () => ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('This is a simple snack bar'),
                ),
              ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('This is a simple snack bar'),
        ),
      );
    }
    setState(() {
      _uploading2 = false;
    });
  }

  final _formKey1 = GlobalKey<FormState>();
  String _enteredText1 = '';
  final _formKey2 = GlobalKey<FormState>();
  String _enteredText2 = '';
  final _formKey = GlobalKey<FormState>();
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'admin'),
                Tab(text: 'Preview'),
                Tab(text: 'Team'),
              ],
            ),
            title: const Text('Cricket Admin'),
          ),
          body:
          TabBarView(
            children: [
              // content for first tab
             SingleChildScrollView(
               child:  Stack(
                 children: [
                   Container(
                       padding: const EdgeInsets.only(top: 10, left: 10),
                       child: Column(
                         children: [
                           Row(
                             children: <Widget>[
                               _file1 == null
                                   ? const Text('No Image1 selected.')
                                   : Text("file selected"),
                               // : Text(_file1!.path),
                               _uploading1
                                   ? const CircularProgressIndicator()
                                   : ElevatedButton(
                                 child: const Text('Select File'),
                                 onPressed: pickFile1,
                               ),
                               const SizedBox(width: 10),
                               _uploading1
                                   ? const Text('Uploading...')
                                   : ElevatedButton(
                                 child: const Text('Upload File'),
                                 onPressed:
                                 _file1 == null ? null : uploadFile1,
                               ),
                             ],
                           ),
                           Row(
                             children: <Widget>[
                               _file2 == null
                                   ? const AutoSizeText('No Image2 selected.')
                                   : AutoSizeText("file selected"),
                               // : Text(_file2!.path),
                               _uploading2
                                   ? const CircularProgressIndicator()
                                   : ElevatedButton(
                                 child: const AutoSizeText('Select File'),
                                 onPressed: pickFile2,
                               ),
                               const SizedBox(width: 10),
                               _uploading2
                                   ? const AutoSizeText('Uploading...')
                                   : ElevatedButton(
                                 child: const AutoSizeText('Upload File'),
                                 onPressed:
                                 _file2 == null ? null : uploadFile2,
                               ),
                             ],
                           ),
                           Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Form(
                               key: _formKey1,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                                 children: <Widget>[
                                   TextFormField(
                                     decoration: InputDecoration(
                                       labelText: 'TItile1',
                                       labelStyle: const TextStyle(
                                         color: Colors.grey,
                                         fontWeight: FontWeight.bold,
                                         fontSize: 20,
                                       ),
                                       focusedBorder: OutlineInputBorder(
                                         borderSide: const BorderSide(
                                           color: Colors.blueAccent,
                                           width: 2.0,
                                         ),
                                         borderRadius:
                                         BorderRadius.circular(10.0),
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: const BorderSide(
                                           color: Colors.grey,
                                           width: 1.0,
                                         ),
                                         borderRadius:
                                         BorderRadius.circular(10.0),
                                       ),
                                       hintText: 'Type here',
                                       hintStyle: const TextStyle(
                                         color: Colors.grey,
                                         fontSize: 16,
                                       ),
                                     ),
                                     style: const TextStyle(
                                       color: Colors.black,
                                       fontSize: 18,
                                     ),
                                     onChanged: (value) {
                                       setState(() {
                                         _enteredText1 = value;
                                       });
                                     },
                                   ),
                                   const SizedBox(height: 16),
                                   ElevatedButton(
                                     onPressed: () {
                                       if (_enteredText1 != null) {
                                         uploadtitle();
                                       }
                                     },
                                     child: const Text('Submit'),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(16.0),
                             child: Form(
                               key: _formKey2,
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.stretch,
                                 children: <Widget>[
                                   TextFormField(
                                     decoration: InputDecoration(
                                       labelText: 'Enter Text',
                                       labelStyle: const TextStyle(
                                         color: Colors.grey,
                                         fontWeight: FontWeight.bold,
                                         fontSize: 20,
                                       ),
                                       focusedBorder: OutlineInputBorder(
                                         borderSide: const BorderSide(
                                           color: Colors.blueAccent,
                                           width: 2.0,
                                         ),
                                         borderRadius:
                                         BorderRadius.circular(10.0),
                                       ),
                                       enabledBorder: OutlineInputBorder(
                                         borderSide: const BorderSide(
                                           color: Colors.grey,
                                           width: 1.0,
                                         ),
                                         borderRadius:
                                         BorderRadius.circular(10.0),
                                       ),
                                       hintText: 'Type here',
                                       hintStyle: const TextStyle(
                                         color: Colors.grey,
                                         fontSize: 16,
                                       ),
                                     ),
                                     style: const TextStyle(
                                       color: Colors.black,
                                       fontSize: 18,
                                     ),
                                     onChanged: (value) {
                                       setState(() {
                                         _enteredText2 = value;
                                       });
                                     },
                                   ),
                                   const SizedBox(height: 16),
                                   ElevatedButton(
                                     onPressed: () {
                                       if (_enteredText2 != null) {
                                         uploadsubtitle();
                                       }
                                     },
                                     child: const Text('Submit'),
                                   ),
                                 ],
                               ),
                             ),
                           ),
                         ],
                       )),
                 ],
               ),
             ),

              Container(
                padding: const EdgeInsets.only(top: 10),
                child:Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter text here',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontStyle: FontStyle.italic,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue, width: 2.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 5,
                        maxLength: 100,
                        keyboardType: TextInputType.text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _text = value!;
                        },
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if(_text!=null){
                            uploadpreview();
                          }else{
                            print('do  nothing');
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ],
                  ),
                )
                ,

              ),
              // content for second tab
              ListView.builder(
                itemCount: _data.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
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

  void uploadtitle() async {
    var title = _enteredText1.trim().toString();
    final DatabaseReference ref2 =
        FirebaseDatabase.instance.reference().child('files');
    await ref2.child(key1).update({'title': title}).whenComplete(
        () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('sucess'),
              ),
            ));
  }

  void uploadsubtitle() async {
    var subtitle = _enteredText2.trim().toString();
    final DatabaseReference ref2 =
        FirebaseDatabase.instance.reference().child('files');
    await ref2.child(key1).update({'subtitle': subtitle}).whenComplete(
        () => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('sucess'),
              ),
            ));
  }

  void uploadpreview() async{
    print(_formKey);
    var preview = _text.toString();
    final DatabaseReference ref2 =
    FirebaseDatabase.instance.reference().child('files');
    await ref2.child(key1).update({'preview': preview}).whenComplete(
            () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('sucess'),
          ),
        ));

  }
}
