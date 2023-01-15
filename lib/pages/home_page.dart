import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'booking.dart';
import 'u_setting.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //details of appointment
  List<String> Lab_name = [
    "Professional",
    "Professional ",
    "Al-Najah ",
    "MedLabs",
  ];
  List<List> selected_test = [
    [
      'ggga',
      "Professional ",
    ],
    [
      'gggj',
      "Professional ",
    ],
    [
      'ggmg',
      "Professional ",
    ],
    [
      'ggbg',
      "Professional ",
    ]
  ];
  List<String> selected_date = ["0/0/0", "0/0/0", "0/0/0", "0/0/0"];
  List<String> selected_time = [
    "5:10",
    "5:10",
    "5:10",
    "5:10",
  ];

  //information about Labs
  List<String> Laboratories = [
    "Professional ",
    "Al-Najah ",
    "MedLabs",
    "Medicare",
    "Ajyal Lab"
  ];
  List<String> phone_Lab = [
    "092396420",
    "092396420",
    "092396420",
    "092396420",
    "092396420"
  ];
  List<String> Location = [
    "Nablus-R",
    "Nablus-R",
    "Nablus-R",
    "Nablus-R",
    "Nablus-R",
  ];
  int _page = 0;
  double ttop = 100;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 198, 223),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        elevation: 1,
        title: Container(
          alignment: Alignment.topCenter,
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
          Icon(Icons.attach_money_rounded, size: 32),
          Icon(Icons.article, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.location_on, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        onTap: (index) {
          setState(() {
            _page = index;
            if (index == 4) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Setting_Screen()));
              setState(() {});
                       if (index == 3) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MapSample()));
              setState(() {});
            }
            }
          });
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
              child: Text(
                'Laboratories',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width * 0.052,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: <Widget>[
                for (int i = 0; i < Laboratories.length; i++)
                  Laboratory(context, MediaQuery.of(context).size, i),
              ]),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.06),
              child: Text(
                'Appointment Details',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: MediaQuery.of(context).size.width * 0.052,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            for (int j = 0; j < Lab_name.length; j++) appointmentt(context, j)
          ],
        ),
      ),
    );
  }

  Widget appointmentt(BuildContext context, int i) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.07),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.28,
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
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25, top: 30),
                    child: Text(
                      Lab_name[i],
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 63, top: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            color: Color.fromARGB(255, 9, 78, 153),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              selected_date[i],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 197, top: 70),
                  child: Row(
                    children: [
                      Icon(
                        Icons.timer_sharp,
                        color: Color.fromARGB(255, 9, 78, 153),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          selected_time[i],
                          style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.05,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )),
              Padding(
                padding: EdgeInsets.only(top: 70, left: 25),
                child: Text(
                  "Selected Test:",
                  style: TextStyle(
                      color: Color.fromARGB(255, 9, 78, 153),
                      fontSize: MediaQuery.of(context).size.width * 0.05,
                      fontWeight: FontWeight.w700),
                ),
              ),
              for (int k = 0; k < selected_test[i].length; k++)
                text_wed(context, selected_test[i][k], k),
              Padding(
                padding: EdgeInsets.only(top: 160, left: 200),
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height * 0.032,
                      width: MediaQuery.of(context).size.width * 0.12,
                      //margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Color(0xFFFB475F).withOpacity(.65)),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 1),
                          child: IconButton(
                            alignment: Alignment.topCenter,
                            icon: Icon(
                              Icons.close,
                              size: 12,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onPressed: () {
                              showAlertDialog(context);
                            },
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.of(context).size.height * 0.032,
                      width: MediaQuery.of(context).size.width * 0.12,
                      //margin: EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                          color: Color(0xFFFB475F).withOpacity(.65)),
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 1),
                          child: IconButton(
                            alignment: Alignment.topCenter,
                            icon: Icon(
                              Icons.edit,
                              size: 12,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Booking_page()));
                              setState(() {});
                            },
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = ElevatedButton(
      child: Text("Cancel"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(255, 159, 198, 223),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      },
    );
    Widget continueButton = ElevatedButton(
      child: Text("Continue"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Color.fromARGB(255, 159, 198, 223),
        ),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
      ),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Delete Appointment"),
      content: Text("Are you sure you want to delete this appointment?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget text_wed(BuildContext context, String s, int i) {
    if (i != 0) ttop = ttop + 25;
    if (i == 0) ttop = 100;
    return Padding(
      padding: EdgeInsets.only(left: 30, top: ttop),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Text(
          s,
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: MediaQuery.of(context).size.width * 0.045,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  Widget Laboratory(BuildContext context, Size size, int i) {
    return Padding(
        padding: EdgeInsets.only(left: size.height * 0.03),
        child: Stack(
          children: [
            Container(
              width: size.width * 0.7,
              height: size.height * 0.12,
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
              child: Stack(children: <Widget>[
                // Big light background
                Positioned(
                  right: 170,
                  top: 0,
                  bottom: 0,
                  left: 2,
                  child: Container(
                    width: size.width * 0.5,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        topRight: Radius.circular(20.0),
                      ),
                      color: Color.fromARGB(255, 253, 250, 250),
                    ),
                    child: Image.asset(
                      'assets/images/Laboratory.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                Positioned(
                  // right: 10,
                  left: 100,
                  top: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            Laboratories[i],
                            style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.05,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.007),
                          Text(
                            Location[i],
                            style: TextStyle(
                                color: Color.fromARGB(255, 9, 78, 153),
                                fontSize:
                                    MediaQuery.of(context).size.width * 0.035,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Row(children: [
                            Text(
                              phone_Lab[i],
                              style: TextStyle(
                                  color: Color.fromARGB(255, 9, 78, 153),
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.035,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(padding: EdgeInsets.only(left: 30)),
                            Container(
                              alignment: Alignment.topCenter,
                              height:
                                  MediaQuery.of(context).size.height * 0.032,
                              width: MediaQuery.of(context).size.width * 0.12,
                              //margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(12),
                                  ),
                                  color: Color(0xFFFB475F).withOpacity(.65)),
                              child: Padding(
                                  padding: EdgeInsets.only(bottom: 1),
                                  child: IconButton(
                                    alignment: Alignment.topCenter,
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Booking_page()));
                                      setState(() {});
                                    },
                                  )),
                            ),
                          ]),
                        ]),
                  ),
                ),
              ]),
            ),
          ],
        ));
  }
}
