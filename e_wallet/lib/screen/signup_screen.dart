import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(24, 0, 24, 0),
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create account',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontFamily: 'RobotoSlab',
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 12),
            Text('Please sign in to continue',
                style: TextStyle(
                    color: Color(0xFF787878),
                    fontFamily: 'RobotoSlab',
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: 66,
            ),
            TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(30, 24, 0, 24),
                  labelStyle: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 20,
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.w700),
                  labelText: 'Full name',
                  filled: true,
                  fillColor: Color(0xFF730028),
                  prefixIcon: Icon(
                    Icons.person,
                    size: 26,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFF730028))),
                )),
            SizedBox(
              height: 16,
            ),
            TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(30, 24, 0, 24),
                  labelStyle: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 20,
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.w700),
                  labelText: 'Email',
                  filled: true,
                  fillColor: Color(0xFF730028),
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    size: 26,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFF730028))),
                )),
            SizedBox(
              height: 16,
            ),
            TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(30, 24, 0, 24),
                  labelStyle: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 20,
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.w700),
                  labelText: 'Password',
                  filled: true,
                  fillColor: Color(0xFF730028),
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 26,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFF730028))),
                )),
            SizedBox(
              height: 16,
            ),
            TextField(
                style: TextStyle(color: Colors.white, fontSize: 18),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(30, 24, 0, 24),
                  labelStyle: TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 20,
                      fontFamily: 'RobotoSlab',
                      fontWeight: FontWeight.w700),
                  labelText: 'Confirm Password',
                  filled: true,
                  fillColor: Color(0xFF730028),
                  prefixIcon: Icon(
                    Icons.lock,
                    size: 26,
                    color: Colors.white,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: Color(0xFF730028))),
                )),
            SizedBox(
              height: 16,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side: BorderSide(color: Colors.red)),
                    backgroundColor: Color(0xFFF40057),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(18, 16, 18, 16),
                    child: Row(
                      children: [
                        Text(
                          'SIGN UP',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'RobotoSlab',
                              fontWeight: FontWeight.w700),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 28,
                          color: Colors.white,
                        )
                      ],
                    ),
                  )),
            ]),
            SizedBox(
              height: 66,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                    text: "Already have an account?",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFFCCCCCC),
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w700),
                    children: <TextSpan>[
                      TextSpan(
                        text: " Sign in",
                        style: TextStyle(
                            color: Color(0xFFCC0047),
                            fontWeight: FontWeight.w500),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
