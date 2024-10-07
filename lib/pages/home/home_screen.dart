import 'dart:io';
import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/login/login_request_model.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/apiservices/models/versioncontrol/version_control_request_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/data/hardcoded/secret_key.dart';
import 'package:insp/pages/home/student_home_screen.dart';
import 'package:insp/pages/home/teacher_home_screen.dart';
import 'package:insp/utils/isAdbEnabled.dart';
import 'package:insp/widget/popups/isAdbEnabled.dart';
import 'package:insp/widget/popups/isVersionUpdate.dart';
import 'package:insp/widget/popups/tokenexpire.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userData});

  final LoginResponseModelResult userData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _initializeChecks();
  }

  Future<void> _initializeChecks() async {
    if (Platform.isAndroid || Platform.isIOS) {
      await _checkDeviceStatus();
    }
    await _checkStoreToken(widget.userData);
    await _checkForNewVersion();
  }

  // Function to check ADB and Root status
  Future<void> _checkDeviceStatus() async {
    bool adbEnabled = await DeviceStatusChecker.isAdbEnabled();
    bool deviceRooted = await DeviceStatusChecker.isDeviceRooted();

    if (adbEnabled || deviceRooted) {
      String message = "Please address the following issues to proceed:\n";
      if (adbEnabled)
        message += "- Developer mode is enabled. Please disable it.\n";
      if (deviceRooted)
        message += "- Your device appears to be rooted. Please unroot it.\n";

      _showDialog(
        ADBEnablePopup(message: message),
      );
    }
  }

  Future<void> _checkStoreToken(LoginResponseModelResult userData) async {
    final remoteDataSource = RemoteDataSource();
    final loginData =
        LoginRequestModel(secret_key: secretKey, token: userData.token);
    final isUserTokenValid = await remoteDataSource.doesTokenValid(loginData);

    if (!isUserTokenValid.data.status) {
      _showDialog(const TokenExpired());
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

  @override
  Widget build(BuildContext context) {
    return widget.userData.userType == 0
        ? const StudentHomeScreen()
        : const TeacherHomeScreen();
  }
}
