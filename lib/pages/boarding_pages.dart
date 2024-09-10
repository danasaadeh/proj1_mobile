import 'package:flutter/material.dart';
import 'package:tourism/model/content_model.dart';
import 'package:tourism/pages/first.dart';
import 'package:tourism/pages/splash.dart';


class Onbording extends StatefulWidget {
  static String id = "onboarding";
  const Onbording({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Image.asset(
                        contents[i].image,
                        height: 300,
                        width: 300,
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        contents[i].title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color:Color(0XFF1B4158), 
                        ),
                      ),
                      const SizedBox(height: 17),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
              width: 180,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == contents.length - 1) {
                    Navigator.pushReplacementNamed(context, FirstPage.id);
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 68, 111, 168)),
                ),
                child: Text(
                  currentIndex == contents.length - 1 ? "Continue" : "Next",
                  style: const TextStyle(color: Colors.white),
                ),
              )),
          const SizedBox(
            height: 90,
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 68, 111, 168),
      ),
    );
  }
}
