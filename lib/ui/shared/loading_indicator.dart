import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

Widget loadingIndicator() {
  return Center(
    child: SpinKitWave(
      color: Colors.green,
      type: SpinKitWaveType.center,
      size: 50.0,
      duration: const Duration(milliseconds: 3000),
    ),
  );
}
