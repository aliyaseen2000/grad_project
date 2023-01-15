import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../common/theme_helper.dart';
import 'home_page.dart';

class price_page extends StatefulWidget {
  const price_page({Key? key}) : super(key: key);
  @override
  _price_pageState createState() => new _price_pageState();
}

List index = [];
List letters = [
  'A',
  'B',
  'C',
  'D',
  'E',
  'F',
  'G',
  'H',
  'I',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'P',
  'Q',
  'R',
  'S',
  'T',
  'U',
  'V',
  'W',
  'X',
  'Y',
  'Z'
];

class _price_pageState extends State<price_page> {
  List<String> test_name = [
    "Albumin, Fluid",
    "Albumin, Serum",
    "Alk Phosphatase Total",
    "Amylase, Urine",
    "ASOT",
    "Bence Jones Protein",
    "Bilirubin, total",
    "Bleeding Time",
    "Blood Urea Nitrogen",
    "Brucella (Screen)",
    "Calcium, Urine",
    "CBC (22 Parameters)",
    "CK-MB",
    "Coomb's Indirect",
    "Cortisol,total in serum",
    "CPK",
    "C-Peptide",
    "D-Dimer (Quantitative)",
    "DHEA-S",
    "Electrolytes",
    "ESR",
    "Ferritin ",
    "Fibrinogen",
    "Folate in RBC's",
    "Glucose Tolerance Test",
    "Growth Hormone ",
    "H. pylori Antigen",
    "HDL-Cholesterol",
    "Hepatitis A Total",
    "High Vaginal",
    "Insulin",
    "Iron",
    "LDH",
    "Lipase",
    "Magnesium, Serum",
    "Magnesium, Urine",
    "Occult Blood",
    "Protein Total",
    "Pus Culture",
    "Semen Analysis",
    "Stool Culture",
    "T3, total",
    "TSH",
    "Urea, Urine",
    "Urine Culture",
    "Vitamin B12",
    "Widal Test",
    "Wound Culture",
    "Zinc, Semen",
    "Zinc, Serum"
  ];
  List<String> test_price = [
    "40",
    "25",
    "25",
    "60",
    "25",
    "60",
    "30",
    "30",
    "25",
    "25",
    "40",
    "30",
    "60",
    "60",
    "100",
    "40",
    "150",
    "140",
    "150",
    "70",
    "25",
    "80",
    "60",
    "130",
    "70",
    "120",
    "80",
    "25",
    "150",
    "80",
    "150",
    "40",
    "40",
    "90",
    "50",
    "60",
    "40",
    "20",
    "60",
    "70",
    "60",
    "60",
    "60",
    "30",
    "60",
    "90",
    "60",
    "100",
    "80",
    "80"
  ];
  List<String> test_descr = [
    "The albumin body fluid test is often used to determine the level of albumin levels in your body and to be more specific in your blood.",
    "A serum albumin test measures the amount of this protein in the clear liquid portion of the blood.",
    "An alkaline phosphatase test is often used to screen for or help diagnose diseases of the liver or bones.",
    "This is a test that measures the amount of amylase in urine. Amylase is an enzyme that helps digest carbohydrates.",
    "ASO titer is a blood test to measure antibodies against streptolysin O, a substance produced by group A streptococcus bacteria.",
    "used most often to diagnose and check on multiple myeloma, a type of cancer. Or an abnormal Bence-Jones test result may mean you have a type of malignant lymphom",
    "Bilirubin testing is usually one of a group of tests to check the health of your liver. Bilirubin testing may be done to: Investigate jaundice.",
    "Bleeding time is a medical test that measures how fast small blood vessels in the skin stop bleeding.",
    "(BUN) test reveals important information about how well your kidneys are working. A BUN test measures the amount of urea nitrogen that's in your blood.",
    "Brucella Screen - Brucellosis is a systemic infection that can involve many organs and tissues.",
    "A calcium in urine test measures the amount of calcium in your urine.If your urine calcium levels are too high or too low, it may be a sign of kidney disease.",
    "A complete blood count (CBC) is a blood test. It helps healthcare providers detect a range of disorders and conditions.",
    "is a blood test that looks for a specific enzyme.That enzyme,creatine kinase-myocardial band, is most common in your heart.",
    "The indirect Coombs test looks for antibodies that are floating in the blood",
    "The test is done to check for increased or decreased cortisol production.",
    "This test may be used to: Diagnose heart attack. Evaluate cause of chest pain. Determine if or how badly a muscle is damaged.",
    "C-peptide is measured to tell the difference between insulin the body produces and insulin that is injected into the body.",
    "if your results reveal that you have high levels of D-dimer in your blood, it may mean that you have a blood clotting condition.",
    "(DHEAS) test is most often used to: Find out if your adrenal glands are working right.",
    "is a blood test that measures levels of the body's main electrolytes.",
    "If an ESR test shows that your red blood cells sink faster than normal, it may mean you have a medical condition causing inflammation.",
    "A ferritin test helps your doctor understand how much iron your body stores.",
    "Low fibrinogen may make it difficult for your blood to clot. If you have symptoms of excessive bleeding.",
    "A test result that's lower than normal means you have a folate deficiency, and your healthcare provider may recommend folic acid supplements.",
    "is a lab test to check how your body moves sugar from the blood into tissues like muscle and fat.",
    "The test measures the ability of the pituitary to secrete growth hormone in response to the arginine.",
    "The test looks for proteins (antigens) associated with H. pylori infection in the stool.",
    "High levels of HDL cholesterol can lower your risk for heart disease and stroke.",
    "The Hepatitis A Total test looks for 2 types of antibodies,IgM and IgG antibodies.",
    "High vaginal swab test can help detect infections such as pelvic inflammatory disease, infertility, and cancer which cause health problems.",
    "help doctors find the cause of hypoglycemia and other conditions related to abnormal insulin production.",
    "The iron test is used to measure your blood iron level.",
    "Higher than normal LDH levels usually means you have some type of tissue damage or disease.",
    "This test is done to check for disease of the pancreas, most often acute pancreatitis.",
    "Magnesium deficiency can lead to health problems including: high blood pressure and heart disease. diabetes. osteoporosis.",
    "The Magnesium Urine Test measures the amount of magnesium (an electrolyte) in urine collected over 24 hours.",
    "is a lab test used to check stool samples for hidden (occult) blood.",
    "measures the total amount of two classes of proteins found in the fluid portion of your blood.",
    "This test is done on a pus sample to identify the presence of pathogenic organisms",
    "A semen analysis is a lab test that evaluates sperm count, motility, morphology and more.",
    "A stool culture helps the doctor see if there's a bacterial infection in the intestines.",
    "measures the T3 that is both attached to proteins and floating free in the blood.",
    "A TSH test measures the amount of thyroid stimulating hormone (TSH) in your blood.",
    "This test is mainly used to check a person's protein balance and the amount of food protein needed by severely ill people.",
    "Its a test to check for germs or bacteria in your pee that can cause a urinary tract infection ",
    "This test measures the level of B12 (also called cobalamin) found in your blood. Lower than normal levels of B12 may cause fatigue, muscle weakness.",
    "indicate that the person has the Salmonella enterica serovar typhi bacterial infection.",
    "to find germs (such as bacteria or a fungus) that can cause an infection.",
    "is used to investigate male infertility as well as to evaluate prostate gland function.",
    "zinc excess results from consuming acidic foods or beverages packaged in a zinc-coated (galvanized) container.",
  ];

  TextEditingController searchControler = TextEditingController();
  bool flag = false;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => HomePage()));
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
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 159, 198, 223),
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
            children: <Widget>[
              Row(children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Container(
                    width: 310,
                    padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                    child: TextFormField(
                      controller: searchControler,
                      decoration: ThemeHelper().textInputDecoration(
                          'Search', 'search by enter Test name'),
                    ),
                    decoration: ThemeHelper().inputBoxDecorationShaddow(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 25, 25, 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                    onPressed: () {
                      setState(() {
                        if (searchControler.text.isNotEmpty)
                          flag = true;
                        else
                          flag = false;
                      });

                      print(searchControler.text);
                    },
                  ),
                ),
              ]),
              Padding(
                padding: EdgeInsets.fromLTRB(45, 20, 15, 0),
                child: Text(
                  "All the Test we have are listed below: ",
                  style: TextStyle(
                      color: Color.fromARGB(255, 9, 78, 153),
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              if (!flag || searchControler.text.isEmpty)
                for (int i = 0; i < letters.length; i++)
                  printchar(context, letters[i], i)
              else
                searchh(context, searchControler.text)
            ],
          ),
        ),
      ),
    );
  }

  Widget Laboratory(BuildContext context, Size size, int i) {
    return Padding(
      padding: EdgeInsets.only(left: size.height * 0.03, top: 10),
      child: Stack(children: [
        Container(
          width: size.width * 0.63,
          height: size.height * 0.092,
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
            Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                child: Text(
                  test_name[i],
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: MediaQuery.of(context).size.width * 0.042,
                      fontWeight: FontWeight.w700),
                )),
            Row(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, 40, 0, 0),
                child: Text.rich(TextSpan(children: [
                  TextSpan(
                    text: 'Show Description',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        showAlertDialog(context, i, test_name, test_descr);
                      },
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 9, 78, 153)),
                  ),
                ])),
              ),
              Padding(padding: EdgeInsets.only(left: 15)),
              Padding(
                padding: EdgeInsets.fromLTRB(28, 40, 0, 0),
                child: Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.of(context).size.height * 0.032,
                  width: MediaQuery.of(context).size.width * 0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                      color: Color(0xFFFB475F).withOpacity(.65)),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(
                      test_price[i] + "\$",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: MediaQuery.of(context).size.width * 0.028,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ]),
    );
  }

  Padding order(String tem, int k) {
    index = [];

    for (int i = 0; i < test_name.length; i++) {
      if (test_name[i].substring(0, tem.length).toLowerCase() ==
          tem.toLowerCase()) {
        setState(() {
          index.add(i);
        });
      }
    }
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
      ),
    );
  }

  Widget printchar(BuildContext context, String tem, int j) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * 0.023,
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: size.height * 0.06,
                    ),
                    child: Text(
                      tem,
                      style: TextStyle(
                          color: Color(0xff132137),
                          fontSize: size.width * 0.057,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  order(letters[j], j),
                  if (!index.isEmpty)
                    for (int i = 0; i < index.length; i++)
                      Laboratory(context, MediaQuery.of(context).size, index[i])
                  else if (index.isEmpty)
                    SizedBox(
                      height: size.height * 0.0,
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future search11(String tem) async {
    index = [];

    for (int i = 0; i < test_name.length; i++) {
      if (test_name[i].length == tem.length) {
        if (test_name[i].toLowerCase() == tem.toLowerCase()) {
          index.add(i);
        }
      } else if (test_name[i].length > tem.length) if (test_name[i]
              .substring(0, tem.length)
              .toLowerCase() ==
          tem.toLowerCase()) {
        index.add(i);
      }
    }
  }

  Widget searchh(BuildContext context, String tem) {
    search11(tem);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          if (!index.isEmpty)
            for (int i = 0; i < index.length; i++)
              Laboratory(context, MediaQuery.of(context).size, index[i]),
          if (index.isEmpty)
            Padding(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
              child: Text(
                "No item found",
                style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
        ],
      ),
    );
  }
}

showAlertDialog(BuildContext context, int k, List test_name, List test_descr) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: MediaQuery.of(context).size.height * 0.45,
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.004),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Color(0xff132137),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    test_name[k],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xff132137),
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                  ),
                  Text(
                    test_descr[k],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 9, 78, 153),
                      fontSize: MediaQuery.of(context).size.height * 0.026,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
