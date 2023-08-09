import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phonenumberController = TextEditingController();
  String? _username, _phoneNumber, userNameStatus;
  bool _agree = false;

  void _toggleCheck(bool? newValue) {
    setState(() {
      _agree = newValue!;
      print(_agree);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              _fieldTittle('Username'),
              const SizedBox(
                height: 10,
              ),
              _usernameField(),
              const SizedBox(
                height: 40,
              ),
              _fieldTittle('Password'),
              const SizedBox(
                height: 10,
              ),
              _phoneNumberField(),
              const SizedBox(height: 30),
              _checkbox(),
              _submitButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldTittle(String? title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          children: [
            TextSpan(
                text: title.toString(),
                style: TextStyle(
                    fontSize: 16,
                    letterSpacing: -0.5,
                    fontWeight: FontWeight.w600)),
            WidgetSpan(
              child: Transform.translate(
                offset: const Offset(1.0, 1.0),
                child: const Text(
                  '*',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.red,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.black),
          minLines: 1,
          controller: _usernameController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.green,
            ),
            // errorText: _username == ""
            //     ? 'Username should not contain space\nor special characters'
            //     : null,
            contentPadding: const EdgeInsets.only(
                top: 8.0, bottom: 0, left: 16.0, right: 16.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          onChanged: (value) {
            if (value != "") {
              setState(() {
                _username = value.toString().trim();
              });
            }
          },
        ));
  }

  Widget _phoneNumberField() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          enableInteractiveSelection: false,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.black),
          minLines: 1,
          controller: _phonenumberController,
          decoration: InputDecoration(
            fillColor: Colors.white,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.green,
            ),

            // errorText: _phoneNumber == ""
            //     ? 'Username should not contain space\nor special characters'
            //     : null,
            contentPadding: const EdgeInsets.only(
                top: 8.0, bottom: 0, left: 16.0, right: 16.0),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value == "") {
              setState(() {
                _phoneNumber = value.toString().trim();
              });
            }
          },
        ));
  }

  Widget _checkbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 22,
          margin: EdgeInsets.only(right: 14),
          padding: EdgeInsets.only(left: 5),
          child: Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
            ),
            child: Checkbox(
              hoverColor: Colors.white,
              value: _agree,
              onChanged: _toggleCheck,
              activeColor: Colors.red,
              checkColor: Colors.white,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 5, bottom: 5),
          child: Text(
            "Add",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _submitButton() {
    return Container(
      margin: EdgeInsets.only(top: 60, bottom: 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          height: 48,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                elevation: 9,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                print("Username:" + _usernameController.text.toString());

                print("Randomnumber:" + _phonenumberController.text.toString());

                print(_agree == true ? "CheckboxEnable" : "CheckboxDisable");
              },
              child: const Text(
                'SUBMIT',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              )),
        )
      ]),
    );
  }
}
