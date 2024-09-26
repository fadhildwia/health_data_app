import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:health_data_app/components/bottomContainer_bottom.dart';
import 'package:health_data_app/components/reusable_bg.dart';
import 'package:health_data_app/components/roundIcon_button.dart';
import 'package:health_data_app/screens/result_page.dart';
import '../constants.dart';
// import 'Results_Page.dart';
import '../calculator_brain.dart';

enum Gender {
  male,
  female,
}

class FormPage extends StatefulWidget {
  final String selectedGender;

  final String selectedDate;

  FormPage({required this.selectedGender, required this.selectedDate});

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  int? height;
  int? weight;
  int bodyFat = 0;
  int muscleMass = 0;
  int visceralFat = 0;
  int basalMetabolism = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          width: 380,
                          child: Column(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'CURRENT WEIGHT (KG) *',
                                    style: klabelTextStyle,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter a number',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d{0,3}(\.\d{0,1})?$'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      var result = int.parse(value);

                                      setState(() {
                                        weight = result;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'HEIGHT (CM) *',
                                    style: klabelTextStyle,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter a number',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d{0,3}(\.\d{0,1})?$'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      var result = int.parse(value);

                                      setState(() {
                                        height = result;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'BODY FAT (%)',
                                    style: klabelTextStyle,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter a number',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d{0,2}(\.\d{0,1})?$'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      var result = int.parse(value);

                                      setState(() {
                                        bodyFat = result;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'MUSCLE MASS (KG)',
                                    style: klabelTextStyle,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter a number',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d{0,2}(\.\d{0,1})?$'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      var result = int.parse(value);

                                      setState(() {
                                        muscleMass = result;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'VISCERAL FAT',
                                    style: klabelTextStyle,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter a number',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^(1[0-2]|[1-9])$'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      var result = int.parse(value);

                                      setState(() {
                                        visceralFat = result;
                                      });
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'BASAL METABOLISM (KCAL)',
                                    style: klabelTextStyle,
                                  ),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      labelText: 'Enter a number',
                                      border: OutlineInputBorder(),
                                    ),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                        RegExp(r'^\d{0,4}(\.\d{0,1})?$'),
                                      ),
                                    ],
                                    onChanged: (value) {
                                      var result = int.parse(value);

                                      setState(() {
                                        basalMetabolism = result;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      BottomContainer(
                        text: 'CALCULATE',
                        onTap: () {
                          if (height! > 0 && weight! > 0) {
                            Calculate calc =
                                Calculate(height: height!, weight: weight!);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ResultPage(
                                  bmi: calc.result(),
                                  resultText: calc.getText(),
                                  advise: calc.getAdvise(),
                                  textColor: calc.getTextColor(),
                                  height: height.toString(),
                                  weight: weight.toString(),
                                  bodyFat: bodyFat.toString(),
                                  muscleMass: muscleMass.toString(),
                                  visceralFat: visceralFat.toString(),
                                  basalMetabolism: basalMetabolism.toString(),
                                  selectedDate: widget.selectedDate,
                                  selectedGender: widget.selectedGender,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
