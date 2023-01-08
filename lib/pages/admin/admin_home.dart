import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grad_project/pages/admin/appointment.dart';
import 'package:grad_project/pages/admin/record.dart';
import 'package:grad_project/pages/admin/setting.dart';

class admin_homepage extends StatefulWidget {
  const admin_homepage({Key? key}) : super(key: key);
  @override
  _admin_homepageState createState() => new _admin_homepageState();
}

class _admin_homepageState extends State<admin_homepage> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 198, 223),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        elevation: 1,
        title: Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.height * 0.065,
            child: Image.asset(
              'assets/images/hemog_black.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        height: 60.0,
        index: 2,
        items: <Widget>[
          Icon(Icons.schedule_outlined, size: 32),
          Icon(Icons.article, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.person_rounded, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        onTap: (index) {
          setState(() {
            _page = index;
            if (index == 0) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => appointment_page()));
              setState(() {});
            }
            if (index == 3) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => record_page()));
              setState(() {});
            }
            if (index == 4) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Settings_Screen()));
              setState(() {});
            }
          });
        },
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 40, left: 40),
              child: Text(
                'Welcome!',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width * 0.068,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 120, left: 18),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 1, left: 18),
                                child: Icon(
                                  Icons.schedule_outlined,
                                  size: 90,
                                  color: Color.fromARGB(255, 9, 78, 153),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 90),
                                child: Text(
                                  'Appointments',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(Size(280, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => appointment_page()));
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 1, left: 13),
                                child: Icon(
                                  Icons.article,
                                  size: 90,
                                  color: Color.fromARGB(255, 9, 78, 153),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 90, left: 3),
                                child: Text(
                                  'Send Result',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(Size(280, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(top: 320, left: 18),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8, left: 18),
                                child: Icon(
                                  Icons.person_rounded,
                                  size: 90,
                                  color: Color.fromARGB(255, 9, 78, 153),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 90, left: 0),
                                child: Text(
                                  'Patient Record',
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(Size(280, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => record_page()));
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: MediaQuery.of(context).size.height * 0.23,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(1.1, 4.0),
                              blurRadius: 8.0),
                        ],
                      ),
                      child: ElevatedButton(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 1, left: 5),
                                child: Icon(
                                  Icons.settings,
                                  size: 90,
                                  color: Color.fromARGB(255, 9, 78, 153),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 90, left: 8),
                                child: Text(
                                  'Settings',
                                  style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          minimumSize: MaterialStateProperty.all(Size(280, 50)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shadowColor:
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Settings_Screen()));
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
