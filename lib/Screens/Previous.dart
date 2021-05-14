import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ucoeadmin/Screens/Announcements.dart';

class Previous extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return BigPrev();
        } else {
          return SmallPrev();
        }
      },
    );
  }
}

class SmallPrev extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class BigPrev extends StatefulWidget {
  @override
  _BigPrevState createState() => _BigPrevState();
}

class _BigPrevState extends State<BigPrev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
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
                      margin: EdgeInsets.only(
                          top: 2, left: 10, right: 10, bottom: 2),
                      height: 60,
                      width: 280,
                      child: MaterialButton(
                        color: Colors.indigo[700],
                        hoverColor: Colors.blue[800],
                        onPressed: () {
                          print('clicked');
                          print('clicked');
                          // Navigator.of(context).pop();
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Homepage()));
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
                              'Previous Data',
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
                width: 400,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 390,
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                      ),
                      child: Center(
                        child: Text(
                          'Events',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Container(
                      width: 500,
                      height: MediaQuery.of(context).size.height - 100,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Events')
                            // .where('CheckFees', isEqualTo: 0)
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
                            children:
                                snapshot.data.docs.map<Widget>((document) {
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  // height: 200,
                                  width: 300,
                                  // color: Colors.green,
                                  child: Column(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            'Annoucement',
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
                                              'Title :', document['eventname']),
                                          SingleValue(
                                              'Note :', document['eventdesc']),
                                          SingleValue(
                                              'Note :', document['eventfunc'])
                                        ],
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('Events')
                                              .doc(document.id)
                                              .delete()
                                              .then((value) {
                                            Fluttertoast.showToast(
                                                msg: 'Deleted',
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
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ));
                            }).toList(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                width: 400,
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Container(
                      height: 80,
                      width: 390,
                      decoration: BoxDecoration(
                        color: Colors.indigo[900],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                      ),
                      child: Center(
                        child: Text(
                          'Annoucements',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                    Container(
                      width: 500,
                      height: MediaQuery.of(context).size.height - 100,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('announcements')
                            // .where('CheckFees', isEqualTo: 0)
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
                            children:
                                snapshot.data.docs.map<Widget>((document) {
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
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  // height: 200,
                                  width: 300,
                                  // color: Colors.green,
                                  child: Column(
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 30,
                                          ),
                                          Text(
                                            'Annoucement',
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
                                              'Title :', document['head']),
                                          SingleValue(
                                              'Note :', document['body']),
                                        ],
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('announcements')
                                              .doc(document.id)
                                              .delete()
                                              .then((value) {
                                            Fluttertoast.showToast(
                                                msg: 'Deleted',
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
                                        child: Text(
                                          'Delete',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      )
                                    ],
                                  ));
                            }).toList(),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
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
        maxLines: 5,
        style: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      SizedBox(
        width: 20,
      ),
      Container(
        width: 290,
        child: Text(
          val,
          maxLines: 100,
          overflow: TextOverflow.ellipsis,
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
