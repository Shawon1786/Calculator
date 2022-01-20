
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Calculator',
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, fontFamily: 'Pushster'),),
          centerTitle: true,
          backgroundColor: Color(0xff10ac84),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              child: Calculate(),
            ),
          ),
        ),
      ),
    );
  }
}
class Calculate extends StatefulWidget {
  const Calculate({Key? key}) : super(key: key);

  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  double currentvalue= 0;
  @override
  Widget build(BuildContext context) {
    var calc= SimpleCalculator(
      value: currentvalue,
      hideExpression: false,
      hideSurroundingBorder: true,
      onChanged: (key, value, expression){
        setState(() {
          currentvalue= value ?? 0;
        });
        print("$key\$value\$expression");
      },
      onTappedDisplay: (value, details){
        print("$value\${details.globalPosition}");
      },
      theme: const CalculatorThemeData(
        borderColor: Colors.black,
        borderWidth: 3,
        displayColor: Color(0xff222f3e),
        displayStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 200, color: Colors.white),
        expressionColor: Color(0xff009432),
        expressionStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 28, color: Colors.white),
        operatorColor: Color(0xfff53b57),
        operatorStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 50, color: Colors.white),
        commandColor: Color(0xffe84393),
        commandStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 50, color: Colors.white),
        numColor: Color(0xffEE5A24),
        numStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 50, color: Colors.white),
      ),
    );
    return OutlinedButton(
      child: Text("Calculate Please", style: TextStyle(backgroundColor: Color(0xfff53b57), color: Colors.white,fontSize: 35, fontWeight: FontWeight.bold,),),

      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.87,
              child: calc,
            );
            });
      },
    );
  }
}

