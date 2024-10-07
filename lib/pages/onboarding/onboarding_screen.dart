import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/versioncontrol/version_control_request_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/pages/login/login_screen.dart';
import 'package:insp/utils/isAdbEnabled.dart';
import 'package:insp/widget/popups/isAdbEnabled.dart';
import 'package:insp/widget/popups/isVersionUpdate.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;
  List onBoardingData = [
    {
      "image": "assets/images/Onboarding1.png",
      "title": "Get access to the test notes",
      "description":
          " Welcome to INSP! Gain access to a wealth of knowledge through our curated test notes. Explore and enhance your learning experience with comprehensive study materials",
    },
    {
      "image": "assets/images/Onboarding2.png",
      "title": "Join from anywhere",
      "description":
          "Join from anywhere, anytime! Our platform offers the flexibility to access study materials and connect with fellow learners from  the comfort of your own space. Your education, your rules",
    },
    {
      "image": "assets/images/Onboarding3.png",
      "title": "Clear your doubts in no time",
      "description":
          " Have questions? Clear your doubts in no time! Connect with educators and peers effortlessly, ensuring a smooth learning journey. Say goodbye to uncertainties, embrace clarity!"
    },
  ];

  @override
  void initState() {
    super.initState();
    _checkDeviceStatus();
    _checkForNewVersion();
  }

  // Function to check ADB and Root status
  Future<void> _checkDeviceStatus() async {
    if (Platform.isAndroid) {
      bool adbEnabled = await DeviceStatusChecker.isAdbEnabled();
      bool deviceRooted = await DeviceStatusChecker.isDeviceRooted();

      if (adbEnabled || deviceRooted) {
        String message = "Please address the following issues to proceed:\n";

        if (adbEnabled) {
          message +=
              "- Developer mode is currently enabled. Please disable it.\n";
        }

        if (deviceRooted) {
          message +=
              "- Your device appears to be rooted. Please unroot your device.\n";
        }

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return ADBEnablePopup(
              message: message,
            );
          },
        );
      }
    }
    if (Platform.isIOS) {
      bool deviceJailBroken = await DeviceStatusChecker.isDeviceJailbroken();
      String message = "Please address the following issues to proceed:\n";

      if (deviceJailBroken) {
        message +=
            "- Developer mode is currently enabled. Please disable it.\n";
      }

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ADBEnablePopup(
            message: message,
          );
        },
      );
    }
  }

  Future<void> _checkForNewVersion() async {
    final remoteDataSource = RemoteDataSource();
    String device = Platform.isWindows
        ? "WINDOW"
        : Platform.isMacOS
            ? 'MACOS'
            : Platform.isAndroid
                ? 'ANDROID'
                : Platform.isIOS
                    ? 'IOS'
                    : '';
    final versionData =
        VersionControlRequestModel(version: '1.0.0', deviceName: device);
    final isVersionValid =
        await remoteDataSource.checkIsNewVersionAvailable(versionData);

    if (!isVersionValid.data.status) {
      _showDialog(VersionControlPopup(
          version: isVersionValid.data.version,
          message: isVersionValid.data.description));
    }
  }

  void _showDialog(Widget dialog) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => dialog,
    );
  }

  void _onSkipButton() {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionDuration: Duration.zero, // No transition duration
        reverseTransitionDuration: Duration.zero, // No reverse transition
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return child; // Directly return the child without any animation
        },
      ),
      (route) => false, // Remove all previous routes
    );
  }

  void _onBackwardButton() {
    if (_currentPage == 0) {
    } else {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _onNextButton() {
    if (_currentPage == onBoardingData.length - 1) {
      Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginScreen(),
          transitionDuration: Duration.zero, // No transition duration
          reverseTransitionDuration: Duration.zero, // No reverse transition
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return child; // Directly return the child without any animation
          },
        ),
        (route) => false, // Remove all previous routes
      );
    } else {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: _onBackwardButton,
            icon: const Icon(Icons.chevron_left_outlined),
          ),
          actions: [
            TextButton(
              onPressed: _onSkipButton,
              child: const Text(
                "Skip",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, 0.81)),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Image.asset('assets/images/insplogo.png'),
            ),
            Expanded(
                child: Stack(children: [
              PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: onBoardingData.length,
                onPageChanged: (int index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        onBoardingData[index]['image'],
                        height: 300,
                      ),
                      Text(
                        onBoardingData[index]['title'],
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 12),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Text(
                          onBoardingData[index]['description'],
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(0, 0, 0, 0.81)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          onBoardingData.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ],
                  );
                },
              )
            ])),
            Container(
              height: 56,
              width: double.infinity,
              margin: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF3C8DBC),
                borderRadius: BorderRadius.circular(16),
              ),
              child: TextButton(
                onPressed: _onNextButton,
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ));
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 5.9),
      height: 10,
      width: _currentPage == index ? 18 : 10,
      decoration: BoxDecoration(
        color: _currentPage == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
