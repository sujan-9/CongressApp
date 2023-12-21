import 'package:flutter/material.dart';

enum UserVerificationStatus { verified, unverified }

extension UserVerificationStatusExtension on UserVerificationStatus {
  bool getVerificationStatus() {
    if (this == UserVerificationStatus.verified) {
      return true;
    } else {
      return false;
    }
  }
}

extension UserVerificationStatusFlag on bool {
  UserVerificationStatus getVerificationStatusFlag() {
    if (this == true) {
      return UserVerificationStatus.verified;
    } else {
      return UserVerificationStatus.unverified;
    }
  }
}

extension CustomPaddingX on Widget {
  Padding addPadding(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );
}

extension CustomFontSizeX on Text {
  Text withSize(double size) {
    return Text(
      data!,
      style: TextStyle(fontSize: size),
    );
  }
}

extension CustomColor on Text {
  Text addColor(Color? color) {
    return Text(
      data ?? "",
      style: TextStyle(color: color),
    );
  }
}
