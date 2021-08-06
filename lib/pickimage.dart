
import 'package:flutter/material.dart';


var imageFile;
bool uploadFromUrl = false;
String url = "";

Widget setImageViewGallery() {
  if (imageFile != null) {
    return Image.file(imageFile, width: 500, height: 500);
  } else {
    return Text("");
  }
}

Widget setImageViewUrl(String url) {
  return Image.network(url, width: 500.0, height: 500.0);
}

GlobalKey<_SelectImageState> widgetKey = GlobalKey<_SelectImageState>();
class SelectImage extends StatefulWidget {
  const SelectImage({ Key? key }) : super(key: key);

  @override
  _SelectImageState createState() => _SelectImageState();
}

class _SelectImageState extends State<SelectImage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}
