import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/add_injections.dart';
import '../lib/common_widgets/handshake_dev.dart';
import 'myapp.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AddInjections.injections();
  HttpOverrides.global = MyHttpOverrides(); //Allowing https req in emulator locally
  runApp(const MyApp());
}
