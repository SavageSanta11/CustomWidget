import 'dart:io';

import 'model/file_DataModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:image_picker/image_picker.dart';
import 'pickimage.dart';

const Color buttoncolor = Color(0xff102c34);

GlobalKey<_DropZoneWidgetState> widgetKey = GlobalKey<_DropZoneWidgetState>();

class DropZoneWidget extends StatefulWidget {
  final ValueChanged<File_Data_Model> onDroppedFile;

  const DropZoneWidget({Key? key, required this.onDroppedFile})
      : super(key: key);
  @override
  _DropZoneWidgetState createState() => _DropZoneWidgetState();
}

class _DropZoneWidgetState extends State<DropZoneWidget> {
  late DropzoneViewController controller;
  bool highlight = false;
  String previewImgUrl = "";

  Future<String> openGallery() async {
    final picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = File(pickedFile!.path);
    });

    return "https://thumbs-prod.si-cdn.com/P4Smi9MthEBXH7pdW8Y-bvwR6ts=/1072x720/filters:no_upscale()/https://public-media.si-cdn.com/filer/04/8e/048ed839-a581-48af-a0ae-fac6fec00948/gettyimages-168346757_web.jpg";
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
        child: Column(children: [
      Container(
        height: 50.0,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Stack(
          alignment: Alignment.center,
          children: [
            DropzoneView(
              onCreated: (controller) => this.controller = controller,
              onDrop: UploadedFile,
              onHover: () => setState(() => highlight = true),
              onLeave: () => setState(() => highlight = false),
            ),
            
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                    hintText: "Drag and drop a photo",
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    ),
                validator: (value) {
                  if (!Uri.parse(value!).isAbsolute) {
                    return "Please enter valid URL";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        ),
      ),
      Container(
          child: previewImgUrl != ""
              ? Image.network(
                  previewImgUrl,
                  width: 500.0,
                  height: 500.0,
                )
              : SizedBox()),
      Padding(
        padding: EdgeInsets.all(16.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: 30.0,
          child: ElevatedButton.icon(
            onPressed: () async {
              final events = await controller.pickFiles();
              if (events.isEmpty) return;
              UploadedFile(events.first);

              /*setState(() async {
                previewImgUrl = await openGallery();
              });*/
            },
            icon: Icon(Icons.upload_file),
            label: Text(
              'Upload',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            style: ElevatedButton.styleFrom(
                primary: buttoncolor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),)),
          ),
        ),
      ),
      
    ]));
  }

  Future UploadedFile(dynamic event) async {
    final name = event.name;

    final mime = await controller.getFileMIME(event);
    final byte = await controller.getFileSize(event);
    final url = await controller.createFileUrl(event);

    print('Name : $name');
    print('Mime: $mime');

    print('Size : ${byte / (1024 * 1024)}');
    print('URL: $url');

    final droppedFile =
        File_Data_Model(name: name, mime: mime, bytes: byte, url: url);

    widget.onDroppedFile(droppedFile);
    setState(() {
      highlight = false;
    });
  }
}
