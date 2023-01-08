import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:grad_project/pages/admin/admin_home.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';

class appointment_page extends StatefulWidget {
  const appointment_page({Key? key}) : super(key: key);
  @override
  _appointment_pageState createState() => new _appointment_pageState();
}

class _appointment_pageState extends State<appointment_page> {
  //details of appointment
  String date = "";
  List<String> user_name = [
    'Ahmad',
    'Ali',
    'Ahmad',
    'Ali',
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

  List<int> check = [0, 0, 0, 0];
  int _page = 0;
  double ttop = 100;
  TextEditingController dateInputt = TextEditingController();

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 198, 223),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => admin_homepage()));
          },
        ),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.06),
              child: Text(
                'Appointments',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery.of(context).size.width * 0.07,
                  letterSpacing: 0.5,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 40, bottom: 5, left: 25),
              child: TextField(
                  controller: dateInputt,
                  //editing controller of this TextField
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(255, 9, 78, 153),
                      ),
                      //icon of text field
                      labelText: "Enter Date" //label text of field
                      ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2022),
                        lastDate: DateTime(2024),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: Color.fromARGB(
                                    255, 136, 174, 197), // <-- SEE HERE
                                onPrimary: Colors.white, // <-- SEE HERE
                                onSurface: Color.fromARGB(
                                    255, 36, 82, 110), // <-- SEE HERE
                              ),
                              dialogBackgroundColor: Colors.white,
                            ),
                            child: Container(child: child),
                          );
                        });

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateInputt.text = formattedDate;
                        date =
                            formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  }),
            ),
            for (int j = 0; j < user_name.length; j++) appointmentt(context, j)
          ],
        ),
      ),
    );
  }

  Widget appointmentt(BuildContext context, int i) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.07,
          right: MediaQuery.of(context).size.width * 0.07,
          top: MediaQuery.of(context).size.width * 0.03,
          bottom: MediaQuery.of(context).size.width * 0.03),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.22,
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
                      user_name[i],
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 197, top: 30),
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
                padding: EdgeInsets.only(left: 230, top: 100),
                child: IconButton(
                  icon: Icon(
                    Icons.check_circle_rounded,
                    size: 40,
                    color: (check[i] == 1)
                        ? Color.fromARGB(255, 9, 78, 153)
                        : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      if (check[i] == 0) {
                        check[i] = 1;
                        print(check[i]);
                      } else if (check[i] == 1) {
                        check[i] = 0;
                        print(check[i]);
                      }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
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
}
