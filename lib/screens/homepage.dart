import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:bmi_calculator_v1_0/constants.dart';
import 'package:bmi_calculator_v1_0/components/dynamic_card.dart';
import 'package:bmi_calculator_v1_0/components//round_icon_button.dart';
import 'package:bmi_calculator_v1_0/screens/result_page.dart';
import 'package:bmi_calculator_v1_0/components/buttom_button.dart';
import 'package:bmi_calculator_v1_0/calculator_brain.dart';
import 'package:bmi_calculator_v1_0/height_number_builder.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int height = 120;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F6FD),
      appBar: AppBar(
        backgroundColor: kappbarColor,
        title: Center(
          child: Text(
            'BMI Calculator',
            style: kappbarTextStyle,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: DynamicCard(
                      colour: Colors.white,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Age',
                            style: klabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: knumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //RoundIconButton is a custom made widget
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                colour: kthemeColor,
                                onPressed: () {
                                  setState(() {
                                    age < 2 ? age = 1 : age--;
                                  });
                                },
                              ),
                              SizedBox(width: 25),
                              RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  colour: kthemeColor,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: DynamicCard(
                      colour: Colors.white,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Gender',
                            style: klabelTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.man,
                                size: 80,
                              ),
                              Icon(
                                Icons.woman,
                                size: 80,
                              ),
                            ],
                          ),
                          LiteRollingSwitch(
                            onTap: () {},
                            onDoubleTap: () {},
                            onSwipe: () {},
                            onChanged: (bool state) {},
                            value: false,
                            textOn: 'Female',
                            textOnColor: Colors.white,
                            textOff: 'Male',
                            textOffColor: Colors.white,
                            textSize: 16,
                            colorOn: Color(0xFFB13173),
                            colorOff: kthemeColor,
                            iconOn: Icons.done,
                            iconOff: Icons.done,
                            animationDuration: Duration(milliseconds: 400),
                            width: 130,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              //This widget is for heights section
              flex: 4,
              child: DynamicCard(
                colour: Colors.white,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 12),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: klabelTextStyle,
                        ),
                        Text(
                          ' cm',
                          style: kcmTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    RotatedBox(
                        quarterTurns: 2,
                        child:
                            Image(image: AssetImage('images/meter icon.png'))),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                        height: 400, //becomes width after rotation
                        width: 70, //becomes height after rotation
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kthemeColor,
                        ),
                        child: ListWheelScrollView.useDelegate(
                          itemExtent: 60,
                          physics: FixedExtentScrollPhysics(),
                          useMagnifier: true,
                          magnification: 1.4,
                          perspective: 0.005,
                          onSelectedItemChanged: (index) {
                            setState(() {
                              height = index + 120;
                            });
                          },
                          childDelegate: ListWheelChildBuilderDelegate(
                              childCount: 101, //no. of widgets
                              builder: (context, index) =>
                                  HeightNumberBuilder(index)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: DynamicCard(
                colour: Colors.white,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: klabelTextStyle,
                        ),
                        Text(
                          ' kg',
                          style: kcmTextStyle,
                        ),
                      ],
                    ),
                    Text(weight.toString(), style: kweightTextStyle),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kthemeColor,
                        thumbColor: Color(0xFF1D4E89),
                        overlayColor: Color(0x291D4E89),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 11),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 21),
                      ),
                      child: Slider(
                          value: weight.toDouble(),
                          min: 20,
                          max: 120,

                          // inactiveColor: Colors.black,
                          onChanged: (double newValue) {
                            setState(() {
                              weight = newValue.round();
                            });
                          }),
                    ),
                  ],
                ),
              ),
            ),
            ButtomButton(
              buttonTitle: 'Calculate',
              onTap: () {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiValue: calc.getBMIValue().toString(),
                              bmiGrade: calc.getBMIGrade().toString(),
                              suggestion: calc.getSuggestion().toString(),
                            )));
              },
            ),
          ],
        ),
      ),
    );
  }
}
