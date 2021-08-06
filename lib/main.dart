
import 'package:flutter/material.dart';
import 'model/file_DataModel.dart';
import 'DropZoneWidget.dart';
import 'DroppedFileWidget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() {
  runApp(Material(
    child: MaterialApp(
      home: kIsWeb? PhotoPreviewScreen() : PhotoPreviewScreenMobile() ,
      theme: new ThemeData(scaffoldBackgroundColor: const Color(0xffb7cac8)),
      debugShowCheckedModeBanner: false,
    ),
  ));
}

class PhotoPreviewScreen extends StatefulWidget {
  @override
  _PhotoPreviewScreenState createState() => _PhotoPreviewScreenState();
}

class _PhotoPreviewScreenState extends State<PhotoPreviewScreen> {
  String previewImgUrl = "";
  File_Data_Model? file;
  int dropdownValue1 = 0;
  int dropdownValue2 = 0;
  int dropdownValue3 = 0;
  var listHours = [for (var i = 0; i < 24; i += 1) i];
  var listMinutes = [for (var i = 0; i < 60; i += 1) i];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.02,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  "CREATE YOUR FIRST POLL",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 100.0,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.40,
                  child: Text(
                    "Use Qonway to make polls and share them with your friends on any platform",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28.0),
                  ),
                ),
                SizedBox(
                  height: 100.0,
                ),
                Text(
                  'Learn more',
                  style: TextStyle(color: Colors.orange, fontSize: 20.0),
                )
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          ),
          SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "ADD A LINK OR PHOTO",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: DropZoneWidget(
                      onDroppedFile: (file) => setState(() => this.file = file),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DroppedFileWidget(file: file),
                  Text(
                    "QUESTION",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "What do you want to poll?",
                    style: TextStyle(color: Colors.grey, fontSize: 28.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "ANSWERS",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Option 1',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Option 2',
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {}, child: Text("+ Add another option")),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "POLL DURATION",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<int>(
                        hint: Text("Days"),
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownValue1 = newValue!;
                          });
                        },
                        items: <int>[0, 1, 2, 3, 4]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                      DropdownButton<int>(
                        hint: Text("Hours"),
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownValue2 = newValue!;
                          });
                        },
                        items:
                            listHours.map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                      DropdownButton<int>(
                        hint: Text("Minutes"),
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownValue3 = newValue!;
                          });
                        },
                        items:
                            listMinutes.map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 30.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DragAndDrop()),
                        );
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: buttoncolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DragAndDrop extends StatefulWidget {
  const DragAndDrop({Key? key}) : super(key: key);

  @override
  _DragAndDropState createState() => _DragAndDropState();
}

class _DragAndDropState extends State<DragAndDrop> {
  File_Data_Model? file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xffb7cac8),
            alignment: Alignment.center,
            padding: EdgeInsets.all(15),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.4,),
                Container(
                  child: DropZoneWidget(
                    onDroppedFile: (file) => setState(() => this.file = file),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                DroppedFileWidget(file: file),
              ],
            )),
      ),
    );
  }
}

class PhotoPreviewScreenMobile extends StatefulWidget {
  const PhotoPreviewScreenMobile({ Key? key }) : super(key: key);

  @override
  _PhotoPreviewScreenMobileState createState() => _PhotoPreviewScreenMobileState();
}

class _PhotoPreviewScreenMobileState extends State<PhotoPreviewScreenMobile> {
  String previewImgUrl = "";
  File_Data_Model? file;
  int dropdownValue1 = 0;
  int dropdownValue2 = 0;
  int dropdownValue3 = 0;
  var listHours = [for (var i = 0; i < 24; i += 1) i];
  var listMinutes = [for (var i = 0; i < 60; i += 1) i];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
          SingleChildScrollView(
            child: Container(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "ADD A LINK OR PHOTO",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: DropZoneWidget(
                      onDroppedFile: (file) => setState(() => this.file = file),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DroppedFileWidget(file: file),
                  Text(
                    "QUESTION",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "What do you want to poll?",
                    style: TextStyle(color: Colors.grey, fontSize: 28.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "ANSWERS",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Option 1',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(),
                        hintText: 'Option 2',
                      ),
                    ),
                  ),
                  TextButton(
                      onPressed: () {}, child: Text("+ Add another option")),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "POLL DURATION",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DropdownButton<int>(
                        hint: Text("Days"),
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownValue1 = newValue!;
                          });
                        },
                        items: <int>[0, 1, 2, 3, 4]
                            .map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                      DropdownButton<int>(
                        hint: Text("Hours"),
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownValue2 = newValue!;
                          });
                        },
                        items:
                            listHours.map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                      DropdownButton<int>(
                        hint: Text("Minutes"),
                        onChanged: (int? newValue) {
                          setState(() {
                            dropdownValue3 = newValue!;
                          });
                        },
                        items:
                            listMinutes.map<DropdownMenuItem<int>>((int value) {
                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 30.0,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DragAndDrop()),
                        );
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: buttoncolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
       
    );
  }
}