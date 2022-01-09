import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({ Key? key, this.weight, this.height, this.bmi, this.txt }) : super(key: key);
  final String? weight;
  final String? height;
  final String? bmi;
  final String? txt;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  double? _bmi;
  String? _txt;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Result BMI'),
      ),
      body: Container(
        width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/5.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            const Text('ผลการคำนวณค่า BMI ของคุณ',
            style: TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.w600)
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              children: [
                weight(),
                height(),    
              ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Column(children: [
              ElevatedButton(
                onPressed: (){
                  calculate();
                }, 
            child: const Text('คำนวณ', 
            style: TextStyle(fontSize: 25),
            ),
            style: ElevatedButton.styleFrom(
                    fixedSize: Size(120,60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
              ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
               bmi(),
               const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
               txt(),
            ],
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ElevatedButton(onPressed: (){

              Navigator.pop(context);
            }, 
            child: const Text('กลับ',
             style: TextStyle(fontSize: 25),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120,60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                  ),
          ],
        ),
      ),
    );
  }

  Container txt() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
      padding: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.dstATop),
          image: const AssetImage('images/22.jpg'),
        ),
        color: const Color(0xFFFFFFFF),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 12,
            color: Color(0xFFA5A6A9),
          )
        ],
      ),
      child: Text(
        _txt == null ? '' : _txt!.toString(),
        style: const TextStyle(fontSize: 24),
        textAlign: TextAlign.center,
      ),
    );
  }

   Container bmi() {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 25, 30, 10),
      padding: const EdgeInsets.only(top: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xffffffff),
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4), BlendMode.dstATop),
          image: const AssetImage('images/2.jpg'),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 6),
            blurRadius: 12,
            color: Color(0xFFBDBEC7),
          )
        ],
      ),
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 5)),
          const Text(
            'BMI',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
          Text(
            _bmi == null ? '' : _bmi!.toStringAsFixed(2),
            style: const TextStyle(
                fontSize: 50, fontWeight: FontWeight.w700, color: Colors.blue),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Container weight() {
    return Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstIn),
                    image: const AssetImage('images/7.jpg'),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Color(0xFFBDBEC7),
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                width: 160,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.weight,
                        color: Colors.blue[700],
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Text(
                        widget.weight! + ' กก.',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              );
  }

  Container height() {
    return Container(
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
                    image: const AssetImage('images/7.jpg'),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 10,
                      color: Color(0xFFA5A6A9),
                    )
                  ],
                ),
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                width: 160,
                height: 120,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.textHeight,
                        color: Colors.blue[700],
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Text(
                        widget.height! + ' ซม.',
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              );
  }
  void calculate() {
    double w = double.parse(widget.weight!);
    double h = double.parse(widget.height!)/100;
    double hh = h * h;

    setState(() {
      double bmi = w / hh;
      _bmi = bmi;

      if(_bmi! < 18.5){
        _txt = 'น้ำหนักน้อยเกินไป';
      } else if(_bmi! <= 22.99 ){
        _txt = 'น้ำหนักปกติ';
      } else if(_bmi! <= 24.99 ){
        _txt = 'น้ำหนักเกิน(ท้วม)';
      } else if(_bmi! <= 29.99 ){
        _txt = 'อ้วนระดับ 1 (อ้วนระยะเริ่มต้น)';
      } else if(_bmi! <= 39.99 ){
        _txt = 'อ้วนระดับ 2 (อ้วนมาก)';
      } else {
        _txt = 'อ้วนระดับ 3 (อ้วนระดับรุนแรงมาก)';
      }
    }
    );
  }
}