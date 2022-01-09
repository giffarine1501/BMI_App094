import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FormPage extends StatefulWidget {
  const FormPage({ Key? key }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

  late double _bmi;
  late String _txt;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/4.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(FontAwesomeIcons.dumbbell, 
              color: Colors.blue,
              size: 100,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            const Text('กรอกข้อมูลของคุณ',
            style: TextStyle(fontSize: 25, color: Colors.blue, fontWeight: FontWeight.w600),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              Form(
              key: _formKey,   
              child: Column(
              children: [
                weight(),
                const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                hight(),
              ],
            ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                       var route = MaterialPageRoute(
                      builder: (context) => ResultPage(
                        weight: _weight.text,
                        height: _height.text,
                      ),
                    );
                    Navigator.push(context, route);
                    } else {
                     Alert(
                      context: context,
                      type: AlertType.error,
                      title: "ผิดพลาด",
                      style: const AlertStyle(
                        titleStyle: TextStyle(color: Colors.red),
                        descStyle: TextStyle(color: Colors.red),
                      ),
                      desc: "กรุณากรอกข้อมูลของคุณให้ครบ",

                      buttons: [
                        DialogButton(
                          child: const Text(
                            "ลองอีกครั้ง",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                          color: Colors.red,
                        )
                      ],
                    ).show();
                    }
                  },
                  child: const Text(
                    'ยืนยัน',
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(120,60),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
  SizedBox hight() {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: _height,
        validator: (value){
          if (value!.isEmpty){
            return 'กรุณากรอกข้อมูลให้ครบ';
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 3,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label:
          Text( 'ส่วนสูง(เซนติเมตร)',
          style: TextStyle(fontSize: 20)
          ),
          prefixIcon: Icon(Icons.height_outlined),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.blue,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.blue,
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          )
        )
                ),
              ),
    );
  }

  SizedBox weight() {
    return SizedBox(
      width: 350,
      child: TextFormField(
        controller: _weight,
        validator: (value){
          if (value!.isEmpty){
            return 'กรุณากรอกข้อมูลให้ครบ';
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 3,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label:
          Text ('น้ำหนัก(กิโลกรัม)',
          style: TextStyle(fontSize: 20)
          ), 
          prefixIcon: Icon(Icons.monitor_weight_outlined),
          focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.blue,
          )
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.grey,
          )
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            width: 2,
            color: Colors.red,
          )
        )
                ),
              ),
    );
  }

  
}