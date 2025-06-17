import 'dart:io';

import 'package:expand_widget/expand_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class check extends StatefulWidget {
  const check({super.key});

  @override
  State<check> createState() => _checkState();
}

class _checkState extends State<check> {

  File? image;
   late  ImagePicker imagePicker;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }

  Future pic() async
  {
    XFile? a = await ImagePicker().pickImage(source: ImageSource.gallery);

    if(a! == null)
      {
        image = File(a!.path);
      }

    setState(() {
      image;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            pic();
          }, child: Text("ok")),
          image == null ? Text("ok") : Image.file(image!),
        ],
      ),
    );
  }
}

