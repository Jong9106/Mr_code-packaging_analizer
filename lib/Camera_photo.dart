import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'dart:math';

class Photo extends StatefulWidget {
  _PhotoState createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  List<PickedFile> images = [];
  final ImagePicker _picker = ImagePicker();
  File _image;
  List _output;
  bool _loading = false;
  int _ups = 0;
  int _fedex = 0;
  int _servientrega = 0;
  int _amazon = 0;

  void _openCamera() async {
    var picture = await _picker.getImage(source: ImageSource.camera);
    File selected = File(picture.path);
    Navigator.pop(context);
    setState(() {
      images.add(picture);
      _image = File(selected.path);
    });
    classifyImage(_image);
  }

  void _openGallery() async {
    var picture = await _picker.getImage(source: ImageSource.gallery);
    File selected = File(picture.path);
    Navigator.pop(context);
    setState(() {
      images.add(picture);
      _image = File(selected.path);
    });
    classifyImage(_image);
  }

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {});
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 3,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    setState(() {
      _loading = false;
      _output = output;
    });

    count(output);
  }

  count(List output) {
    Random random = new Random();
    if (_output[0]['label'] == '0 Ups') {
      _ups += random.nextInt(90) + 10;
    } else if (_output[0]['label'] == '1 Fedex') {
      _fedex += random.nextInt(90) + 10;
    } else if (_output[0]['label'] == '2 Amazon') {
      _amazon += random.nextInt(90) + 10;
    } else if (_output[0]['label'] == '3 Servientrega') {
      _servientrega += random.nextInt(90) + 10;
    }
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'Assets/model_unquant.tflite',
      labels: 'Assets/labels.txt',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff001C22),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          tooltip: 'package analizer',
          onPressed: null,
        ),
        title: Text(
          '<package analizer>',
          style: GoogleFonts.robotoCondensed(
            textStyle: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            child: GridView.builder(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 10,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemCount: images.length,
              itemBuilder: (BuildContext conext, int index) {
                return Image.file(
                  File(images[index].path),
                );
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(top: 10),
            child: Column(
              children: [
                _output != null
                    ? Text(
                        'Prediction is: ${_output[0]['label']}',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Text(
              'Servientrega: \$ ${_servientrega}\nFedex: \$ ${_fedex}\nAmazon: \$ ${_amazon}\nUps: \$ ${_ups}\n',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  backgroundColor: Colors.white),
              textAlign: TextAlign.center,
            ),
            padding: EdgeInsets.only(bottom: 10),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: _optionsDialogBox,
      ),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text('Take a picture'),
                    onTap: _openCamera,
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text('Select in gallery'),
                    onTap: _openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
