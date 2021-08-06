
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/file_DataModel.dart';

class DroppedFileWidget extends StatelessWidget {

  final File_Data_Model? file;
  const DroppedFileWidget({Key? key, required this.file}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(child: buildImage(context)),
    ],
  );
  }

  Widget buildImage(BuildContext context){
    if (file == null) return buildEmptyFile();

    print(file!.url);

    return Column(
      children: [
        Image.network(file!.url,
          width: 500.0 ,
          height: 500.0,
          fit: BoxFit.cover,
          errorBuilder:(context,error,_)=>buildEmptyFile(),
        ),
      ],
    );
  }

  Widget buildEmptyFile(){
     return Container(
       width: 0,
       height: 0,
      
     );
  }

 
}
