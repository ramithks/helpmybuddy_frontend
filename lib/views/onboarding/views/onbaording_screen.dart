import 'package:flutter/material.dart';
import '../../../global_index.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  OnbordingScreenState createState() => OnbordingScreenState();
}

class OnbordingScreenState extends State<OnbordingScreen> {
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
      backgroundColor: AppColors.mainBg,
      body: Column(
        children: [
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
                  padding: const EdgeInsets.all(35),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgIcon(
                        contents[i].image,
                        height: 300,
                      ),
                      Text(
                        contents[i].title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        contents[i].discription,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 15,
                          color: AppColors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          CustomButton(
            radius: 15,
            verticalPadding: 15,
            horizontalPadding: 40,
            onPressed: () {
              if (currentIndex == contents.length - 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                );
              }
              _controller.nextPage(
                duration: const Duration(milliseconds: 100),
                curve: Curves.bounceIn,
              );
            },
            child: Text(
                style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                ),
                currentIndex == contents.length - 1 ? "Get Started" : "Next"),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              contents.length,
              (index) => buildDot(index, context),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6,
      width: currentIndex == index ? 22 : 7,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: AppColors.white,
      ),
    );
  }
}
