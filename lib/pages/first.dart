import 'package:flutter/material.dart';
import 'package:tourism/pages/login.dart';
import 'package:tourism/pages/signup.dart';
import 'package:tourism/widget/customscaffold.dart';

class FirstPage extends StatelessWidget {
  static String id = "firstpage";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        imagePath: "lib/images/Android Small - 1.png",
        child: SingleChildScrollView(
            child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25, 2, 25, 2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 120,
                ),
                Image.asset("lib/images/logo4.png"),
                SizedBox(
                  height: 90,
                ),
                Text(
                  "It's time to travel",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                Text(
                  "Let's to make your dream vacation",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  height: 75,
                  width: 240,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, LoginPage.id);
                        },
                        child: const Text(
                          "login",
                          style: TextStyle(
                              color: Colors.white, fontSize: 18, height: 0.1),
                        ),
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            backgroundColor: Color(0XFF1B4158),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20))),
                  ),
                ),
                SizedBox(
                  height: 0.01,
                ),
                SizedBox(
                    height: 75,
                    width: 240,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, SignupPage.id);
                          },
                          child: const Text(
                            "signup",
                            style: TextStyle(
                                color: Colors.white, fontSize: 18, height: 0.1),
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Color(0XFF1B4158),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20))),
                    )),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
