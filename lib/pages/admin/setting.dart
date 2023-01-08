import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/pages/admin/edit_profile.dart';
import 'package:grad_project/pages/admin/password.dart';

import '../login_page.dart';
import 'admin_home.dart';

class Settings_Screen extends StatefulWidget {
  Settings_Screen({Key? key}) : super(key: key);

  @override
  _Settings_ScreenState createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 159, 198, 223),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 159, 198, 223),
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        elevation: 0,
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
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black.withOpacity(0.3),
                offset: const Offset(1.1, 4.0),
                blurRadius: 8.0),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.08,
              ),
              Text(
                "Application settings can be customized according to your preferences",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  color: Color.fromARGB(255, 71, 104, 158),
                  fontSize: size.height * 0.025,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: size.height * 0.07,
              ),
              newMethod(context, size, ' Edit Profile', Icons.edit, 0),
              newMethod(
                  context, size, 'Change Password', Icons.key_outlined, 1),
              newMethod(context, size, 'Sign out ', Icons.logout_outlined, 2),
            ],
          ),
        ),
      ),
    );
  }

  Padding newMethod(
      BuildContext context, Size size, String st, IconData next, int i) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.height * 0.015, vertical: size.height * 0.015),
      child: FlatButton(
          padding: EdgeInsets.only(
              left: size.height * 0.03,
              right: size.height * 0.025,
              top: size.height * 0.009,
              bottom: size.height * 0.01),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color.fromARGB(255, 159, 198, 223).withOpacity(0.8),
          onPressed: () {
            callpage(i, context);
          },
          child: Row(
            children: [
              IconButton(
                icon: Icon(
                  next,
                  color: Color.fromARGB(255, 19, 33, 55),
                  size: MediaQuery.of(context).size.height * 0.045,
                ),
                onPressed: () {
                  callpage(i, context);
                },
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.02,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.009),
                  child: Text(
                    st,
                    style: TextStyle(
                        // color: Color(0xff132137),
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Color.fromARGB(255, 19, 33, 55),
                ),
                onPressed: () {
                  callpage(i, context);
                },
              ),
            ],
          )),
    );
  }
}

void callpage(int i, BuildContext context) {
  if (i == 0) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => edit_page()));
  } else if (i == 1) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => password()));
  }
  if (i == 2) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginPage()));
  }
}
