import 'package:flutter/material.dart';
import 'package:tourism/pages/wallet_page.dart';
import 'package:tourism/widget/customscaffold.dart';

class createwalletSuccess extends StatelessWidget {
  static String id = "ghhj";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      imagePath: "lib/images/Android Small - 1.png",
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              size: 100,
              color: Color.fromARGB(255, 81, 126, 163),
            ),
            const SizedBox(height: 20),
            const Text(
              'Done Successfully',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0XFF1B4158),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'Your wallet has been',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0XFF1B4158),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            const Text(
              'created successfully',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0XFF1B4158),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 210,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, walletPage.id);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(255, 51, 86, 116)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ))),
                  child: const Text(
                    " Done",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
