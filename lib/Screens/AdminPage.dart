import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ucoeadmin/Screens/HomePage.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth >= 700) {
          return BigScreen();
        } else if (constraints.maxWidth < 500) {
          return BigScreen();
        } else {
          return Container();
        }
      },
    );
  }
}

class BigScreen extends StatefulWidget {
  @override
  _BigScreenState createState() => _BigScreenState();
}

class _BigScreenState extends State<BigScreen> {
  TextEditingController _UserName = TextEditingController();
  TextEditingController _UserPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
          fit: BoxFit.cover,
          image: AssetImage('assets/images/teenamaam.png'),
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.indigo[900],
                height: 70,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                // child: Center(
                child: Row(
                  children: [
                    Text(
                      'UNIVERSAL COLLEGE OF ENGINEERING',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: Text(
                        'Gujrati Minority  B+  Grade',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                    ),
                  ],
                ),
              ),

              // MaterialButton(
              //   child: Text('Click Me'),
              //   onPressed: () {
              //     FirebaseFirestore.instance
              //         .collection('Hi There')
              //         .doc('hi')
              //         .set({'hi': 'Hi There'}).catchError((e) {
              //       print(e.toString());
              //     });
              //   },
              // ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height - 70,
                    width: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 400,
                          height: MediaQuery.of(context).size.height - 200,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.only(top: 60),
                          decoration: shadow,
                          // child: TextFormField(
                          //   decoration: InputDecoration(
                          //       hintText: 'Enter Code', border: InputBorder.none),
                          // ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 70,
                              ),
                              Container(
                                height: 150,
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                  // fit: BoxFit.cover,
                                  image: AssetImage('assets/images/logo.png'),
                                )),
                              ),
                              SizedBox(
                                height: 160,
                              ),
                              // Text(
                              //   'Admin Login',
                              //   style: TextStyle(
                              //     fontSize: 28,
                              //     fontWeight: FontWeight.w800,
                              //   ),
                              // ),
                              Container(
                                width: 300,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  controller: _UserName,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Admin UserName'),
                                ),
                              ),

                              Container(
                                width: 300,
                                height: 50,
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: TextFormField(
                                  controller: _UserPass,
                                  textInputAction: TextInputAction.go,
                                  onFieldSubmitted: (val) {},
                                  obscureText: true,
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Enter Password'),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  print('clicked');
                                  // FirebaseFirestore.instance
                                  //    .collection('Hi')
                                  //     .add({'hi': 'there'});
                                  if (_UserName.text == 'ucoeadmin' &&
                                      _UserPass.text == 'admin') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Homepage()));
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: 'Login Failed',
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.indigo[900],
                                        textColor: Colors.white);
                                  }
                                },
                                child: Container(
                                  width: 300,
                                  height: 50,
                                  margin: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.indigo[900],
                                    // border: Border.all(width: 2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Center(
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    // color: Colors.red,
                  ),
                  // Container(
                  //   height: MediaQuery.of(context).size.height - 200,
                  //   width: 10,
                  //   child: VerticalDivider(
                  //     thickness: 5,
                  //     width: 10,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  SizedBox(
                    width: 100,
                  ),
                  // Container(
                  //   height: MediaQuery.of(context).size.height - 200,
                  //   width: 750,
                  //   // decoration: BoxDecoration(
                  //   //   image: DecorationImage(
                  //   //     // fit: BoxFit.cover,
                  //   //     image: AssetImage('assets/images/b.png'),
                  //   //   ),
                  //   // ),

                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(20)),
                  //     shape: BoxShape.rectangle,
                  //     // color: Colors.white,
                  //     image: DecorationImage(
                  //         fit: BoxFit.cover,
                  //         image: AssetImage('assets/images/ucoe.jpeg')),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black54,
                  //         blurRadius: 9.0,
                  //         offset: Offset(0.0, 0.75),
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
              Container(
                color: Colors.indigo[900],
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                // child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('@No Copyright',
                        style: TextStyle(fontSize: 20, color: Colors.white))
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

class SmallScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Under Development'),
      ),
    );
  }
}

BoxDecoration blackline = BoxDecoration(
  // color: Colors.white,
  color: new Color.fromRGBO(0, 0, 0, 0.5),
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
  border: Border.all(width: 2, color: Colors.black),
);

BoxDecoration shadow = BoxDecoration(
  borderRadius: BorderRadius.all(Radius.circular(20)),
  shape: BoxShape.rectangle,
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black54,
      blurRadius: 9.0,
      offset: Offset(0.0, 0.75),
    ),
  ],
);
