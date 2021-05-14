import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ucoeadmin/Screens/Announcements.dart';
import 'package:ucoeadmin/Screens/Previous.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return BigHomeScreen();
        } else {
          return SmallHomeScreen();
        }
      }),
    );
  }
}

class BigHomeScreen extends StatefulWidget {
  @override
  _BigHomeScreenState createState() => _BigHomeScreenState();
}

class _BigHomeScreenState extends State<BigHomeScreen> {
  var Data;
  @override
  void initState() {
    super.initState();
    Data = FirebaseFirestore.instance.collection('users').snapshots();
  }

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
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: Colors.indigo[900],
                border: Border.all(width: 1.2, color: Colors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(6),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(top: 2, left: 10, right: 10, bottom: 2),
                    height: 60,
                    width: 280,
                    child: MaterialButton(
                      color: Colors.indigo[300],
                      hoverColor: Colors.blue[800],
                      onPressed: () {
                        print('clicked');
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
                      color: Colors.indigo[700],
                      hoverColor: Colors.blue[800],
                      onPressed: () {
                        print('clicked');
                        Navigator.of(context).pop();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Announcements()));
                      },
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Previous()));
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      padding: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width - 350,
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Update Fee Details',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    StreamBuilder(
                      // FirebaseFirestore.instance
                      //             .collection('Chats')
                      //             .doc(roomId)
                      //             .collection('chat')
                      //             .orderBy('time', descending: true)
                      //             .snapshots()
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .where('CheckFees', isEqualTo: 0)
                          .snapshots(),
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        return ListView(
                          shrinkWrap: true,
                          children: snapshot.data.docs.map<Widget>((document) {
                            // return Text(document['email']);

                            // print(document["email"]);
                            // return StudentDetails(
                            //     document['name'],
                            //     document['email'],
                            //     document['location'],
                            //     document['uid'],
                            //     document['phone'],
                            //     document['Photo'],
                            //     document.id);

                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 0.75),
                                      spreadRadius: 0.8,
                                    )
                                  ]),
                              margin: EdgeInsets.all(10),
                              height: 400,
                              width: MediaQuery.of(context).size.width - 400,
                              // color: Colors.green,
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Student Details',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w800,
                                                  fontSize: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 30,
                                              ),
                                              SingleValue(
                                                  'Name :', document['name']),
                                              SingleValue('Address :',
                                                  document['location']),
                                              SingleValue(
                                                  'Email :', document['email']),
                                              SingleValue(
                                                  'Phone :', document['phone']),
                                            ],
                                          ),
                                        ),
                                        Center(
                                          child: Container(
                                            height: 250,
                                            width: 200,
                                            margin: EdgeInsets.only(
                                                right: 20, top: 20),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10)),
                                                shape: BoxShape.rectangle,
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        document['Photo']))),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(document['uid'])
                                                .update({
                                              'Fees': 1,
                                              'FeesPaid': 1,
                                              'CheckFees': 1,
                                            }).catchError((e) {
                                              print(e.toString());
                                            });
                                          },
                                          hoverColor: Colors.green[300],
                                          color: Colors.green,
                                          child: Text('yes',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(document['uid'])
                                                .update({
                                              'Fees': 0,
                                              'FeesPaid': 0,
                                              'CheckFees': 0,
                                            }).then((value) {
                                              Fluttertoast.showToast(
                                                  msg: 'Not Approved',
                                                  timeInSecForIosWeb: 3,
                                                  textColor: Colors.white,
                                                  backgroundColor:
                                                      Colors.indigo[900]);
                                            }).catchError((e) {
                                              print(e.toString());
                                            });
                                          },
                                          hoverColor: Colors.red[400],
                                          color: Colors.red,
                                          child: Text('No',
                                              style: TextStyle(
                                                color: Colors.white,
                                              )),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
// //
//   StudentDetails(
//                                   document['name'],
//                                   document['email'],
//                                   document['location'],
//                                   document['uid'],
//                                   document['phone'],
//                                   document['Photo'],
//                                   document.id)

  StudentDetails(name, email, address, uid, phone, photo, id) {
    Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.75),
              spreadRadius: 0.8,
            )
          ]),
      margin: EdgeInsets.all(10),
      height: 400,
      width: MediaQuery.of(context).size.width - 400,
      // color: Colors.green,
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Student Details',
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SingleValue('Name :', name),
                      SingleValue('Address :', address),
                      SingleValue('Email :', email),
                      SingleValue('Phone :', phone),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    height: 300,
                    width: 200,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://expertphotography.com/wp-content/uploads/2020/08/social-media-profile-photos-9.jpg'))),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .update({
                      'Fees': 1,
                      'FeesPaid': 1,
                      // 'CheckFees': 1,
                    }).catchError((e) {
                      print(e.toString());
                    });
                  },
                  hoverColor: Colors.green[300],
                  color: Colors.green,
                  child: Text('yes',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(uid)
                        .update({
                      'Fees': 0,
                      'FeesPaid': 0,
                      'CheckFees': 0,
                    }).catchError((e) {
                      print(e.toString());
                    });
                  },
                  hoverColor: Colors.red[400],
                  color: Colors.red,
                  child: Text('No',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

SingleValue(head, val) {
  return Container(
    width: 400,
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Row(children: [
      Text(
        head,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 20,
      ),
      Container(
        child: Text(
          val,
          maxLines: 10,
          style: TextStyle(
            color: Colors.grey[900],
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      )
    ]),
  );
}

userTile(email, id) {
  return Container(
    color: Colors.red,
    height: 70,
    width: 300,
    child: GestureDetector(
      onTap: () {},
      child: Text(email),
    ),
  );
}

// StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('users').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.hasData) {
//             return ListView(
//               children: snapshot.data.docs.map<Widget>((document) {
//                 // return Text(document['UserName']);
//                 return userTile(document['email'], document.id);
//               }).toList(),
//             );
//           } else {
//             return Center(
//               child: CircularProgressIndicator(),

//             );
//           }
//         },
//       )

class SmallHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Under Developement'),
      ),
    );
  }
}

void DialogBox2(context) {
  var baseDialog = AlertDialog(
    title: new Text("Warning"),
    content: Container(
      child: Text('You Want to Go back?'),
    ),
    actions: <Widget>[
      FlatButton(
        color: Colors.indigo[900],
        child: new Text("Back"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ],
  );

  showDialog(context: context, builder: (BuildContext context) => baseDialog);
}
