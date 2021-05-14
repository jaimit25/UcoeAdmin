// import 'dart:io';
import 'dart:math';
import 'dart:html';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:ucoeadmin/Screens/HomePage.dart';
import 'package:ucoeadmin/Screens/Previous.dart';

var option1Text;

class Announcements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return BigAnnouncement();
        } else {
          return SmallAnnouncement();
        }
      },
    );
  }
}

class SmallAnnouncement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Developement'),
    );
  }
}

class BigAnnouncement extends StatefulWidget {
  @override
  _BigAnnouncementState createState() => _BigAnnouncementState();
}

class _BigAnnouncementState extends State<BigAnnouncement> {
  TextEditingController _head = TextEditingController();
  TextEditingController _body = TextEditingController();
  TextEditingController _eventname = TextEditingController();
  TextEditingController _eventdesc = TextEditingController();
  TextEditingController _eventfunc = TextEditingController();
  var imageurl = '';
  Uint8List uploadedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.red[200],
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      child: Row(
        children: [
          Container(
            width: 300,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.indigo[900],
              border: Border.all(width: 1.2, color: Colors.black),
              borderRadius: BorderRadius.all(
                Radius.circular(6),
              ),
            ),
            child: Column(
              children: [
                //MENU
                Container(
                  margin:
                      EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 2),
                  height: 60,
                  width: 280,
                  child: MaterialButton(
                    color: Colors.indigo[700],
                    hoverColor: Colors.blue[800],
                    onPressed: () {
                      print('clicked');
                      print('clicked');
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.auto_awesome_motion,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        Text(
                          'Update Fee Details',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 280,
                  child: MaterialButton(
                    color: Colors.indigo[300],
                    hoverColor: Colors.blue[800],
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.playlist_add,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        Text(
                          'Announcements',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 2),
                  height: 60,
                  width: 280,
                  child: MaterialButton(
                    color: Colors.indigo[700],
                    hoverColor: Colors.blue[800],
                    onPressed: () {
                      print('clicked');
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Previous()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Icon(
                            Icons.auto_awesome_motion,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        Text(
                          'Announcements and Event',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              // shrinkWrap: true,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 400,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    // border: Border.all(width: 1.2, color: Colors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(6),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: shadowBox,
                        height: 390,
                        width: MediaQuery.of(context).size.width - 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                'Announcement',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              width: 700,
                              height: 60,
                              child: TextFormField(
                                controller: _head,
                                // onChanged: (val) {
                                //   setState(() {
                                //     _head.text = val;
                                //   });
                                // },
                                decoration: InputDecoration(
                                  hintText: 'Enter Heading',
                                ),
                              ),
                            ),
                            Container(
                              width: 700,
                              height: 60,
                              child: TextFormField(
                                controller: _body,
                                // onChanged: (val) {
                                //   setState(() {
                                //     _body.text = val;
                                //   });
                                // },
                                decoration: InputDecoration(
                                  hintText: 'Enter Body',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            MaterialButton(
                              height: 50,
                              color: Colors.indigo[900],
                              hoverColor: Colors.indigo[400],
                              onPressed: () {
                                // FirebaseFirestore.instance
                                //     .collection('announcements')
                                //     .add({
                                //   'head': _head.text,
                                //   'body': _body.text,
                                // });
                                if (_body.text != "" && _head.text != "") {
                                  FirebaseFirestore.instance
                                      .collection('announcements')
                                      .add({
                                    'head': _head.text,
                                    'body': _body.text,
                                    'time': Timestamp.now().toString()
                                  }).then((val) {
                                    Fluttertoast.showToast(
                                        msg: 'Announcement Added',
                                        timeInSecForIosWeb: 3,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.indigo[900]);
                                    _head.clear();
                                    _body.clear();
                                  }).catchError((e) {
                                    print(e.toString());
                                    Fluttertoast.showToast(
                                        msg: 'Error Publishing',
                                        // msg: e.toString(),
                                        timeInSecForIosWeb: 3,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.indigo[900]);
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      msg: 'Enter valid Credentials!',
                                      // msg: e.toString(),
                                      timeInSecForIosWeb: 3,
                                      textColor: Colors.white,
                                      backgroundColor: Colors.indigo[900]);
                                }
                              },
                              child: Text(
                                'Publish Announcement',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: shadowBox,
                        height: 300,
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width - 400,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              child: Text(
                                'Add Events',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      margin: EdgeInsets.all(10),
                                      height: 50,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        border: Border.all(
                                            width: 0.2,
                                            color: Colors.grey[800]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: TextFormField(
                                        controller: _eventname,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Enter Event Name'),
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      margin: EdgeInsets.all(10),
                                      height: 100,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        border: Border.all(
                                            width: 0.2,
                                            color: Colors.grey[800]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: TextFormField(
                                        maxLines: 5,
                                        controller: _eventdesc,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'About Event'),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      margin: EdgeInsets.all(10),
                                      height: 100,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[100],
                                        border: Border.all(
                                            width: 0.2,
                                            color: Colors.grey[800]),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: TextFormField(
                                        controller: _eventfunc,
                                        maxLines: 5,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText:
                                                'List of Events/Games...'),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 200,
                                      width: 200,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(imageurl == ''
                                              ? 'https://images.shiksha.com/mediadata/images/1590151182phpyBRFJd.jpeg'
                                              : imageurl),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 75,
                                ),
                                // MaterialButton(
                                //   height: 50,
                                //   color: Colors.red,
                                //   hoverColor: Colors.indigo[400],
                                //   onPressed: () {
                                //     print('clicked');
                                //     // uploadImage();
                                //   },
                                //   child: Text(
                                //     'Add Image',
                                //     style: TextStyle(
                                //       fontSize: 15,
                                //       color: Colors.white,
                                //       fontWeight: FontWeight.w800,
                                //     ),
                                //   ),
                                // ),
                                SizedBox(
                                  width: 10,
                                ),
                                MaterialButton(
                                  height: 50,
                                  color: Colors.indigo[900],
                                  hoverColor: Colors.indigo[400],
                                  onPressed: () async {
                                    if (_eventdesc.text != "" &&
                                        _eventname.text != "" &&
                                        _eventfunc.text != "") {
                                      FirebaseFirestore.instance
                                          .collection('Events')
                                          .doc(_eventname.text)
                                          .set({
                                        'eventname': _eventname.text,
                                        'eventdesc': _eventdesc.text,
                                        'eventfunc': _eventfunc.text
                                      }).then((val) {
                                        Fluttertoast.showToast(
                                            msg: 'Event Added Successfully',
                                            timeInSecForIosWeb: 3,
                                            textColor: Colors.white,
                                            backgroundColor:
                                                Colors.indigo[900]);
                                        _eventfunc.clear();
                                        _eventname.clear();
                                        _eventdesc.clear();
                                      }).catchError((e) {
                                        Fluttertoast.showToast(
                                            msg: 'Error Publishing',
                                            timeInSecForIosWeb: 3,
                                            textColor: Colors.white,
                                            backgroundColor:
                                                Colors.indigo[900]);
                                      });
                                    } else {
                                      Fluttertoast.showToast(
                                          msg: 'Enter valid Details',
                                          timeInSecForIosWeb: 3,
                                          textColor: Colors.white,
                                          backgroundColor: Colors.indigo[900]);
                                    }
                                  },
                                  child: Text(
                                    'Publish Event Details',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }

  // uploadImage() async {
  //   InputElement uploadInput = FileUploadInputElement();
  //   uploadInput.click();
  //   File filee;
  //   final _storage = FirebaseStorage.instance;
  //   uploadInput.onChange.listen((e) {
  //     // read file content as dataURL
  //     final files = uploadInput.files;
  //     if (files.length == 1) {
  //       final file = files[0];
  //       FileReader reader = FileReader();

  //       reader.onLoadEnd.listen((e) {
  //         setState(() {
  //           uploadedImage = reader.result;
  //           // filee = File.fromRawPath(uploadImage);
  //         });
  //       });

  //       reader.onError.listen((fileEvent) {
  //         setState(() {
  //           option1Text = "Some Error occured while reading the file";
  //         });
  //       });

  //       reader.readAsArrayBuffer(file);
  //     }
  //   });
  // }

//   uploadImage() async {
//     // imageurl = "";
//     print('This Code Will Run');
//    final _storage = FirebaseStorage.instance;
//     final _picker = ImagePicker();
//     PickedFile image;

//     // //Check Permissions
//     // await Permission.photos.request();

//     // var permissionStatus = await Permission.photos.status;

//     // if (permissionStatus.isGranted) {
//     //Select Image
//     image = await _picker.getImage(source: ImageSource.gallery);
//     var file = File(image.path);
//     if (image != null) {
//       //Upload to Firebase
//       var snapshot = await _storage
//           .ref()
//           .child('ChatsImage')
//           .child(generateRandomString(200))
//           .putFile(file);

//       var downloadUrl = await snapshot.ref.getDownloadURL();

//       setState(() {
//         imageurl = downloadUrl;
//       });
//       // DialogBoxImage(context);

//       // // FirebaseFirestore.instance.collection('Feed').add({
//       // //   'Photo': imageurl,
//       // //   'Head': heading.text,
//       // //   'body': bodymaterial.text,
//       // // });

//       // print(imageurl);
//     } else {
//       print('No Path Received');
//     }
//   }
//   // else {
//   //   print('Grant Permissions and try again');
//   // }
// }
// // }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  BoxDecoration shadowBox = BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(13)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(0.0, 0.75),
          spreadRadius: 0.96,
        )
      ],
      color: Colors.white);
}
