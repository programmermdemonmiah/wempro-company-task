import 'package:flutter/material.dart';

SizedBox gapH(BuildContext context, double number) => SizedBox(
      height: MediaQuery.sizeOf(context).width * number / 100,
    );
SizedBox gapW(BuildContext context, double number) => SizedBox(
      width: MediaQuery.sizeOf(context).width * number / 100,
    );

//screen padding
EdgeInsets screenPaddingH(BuildContext context) => EdgeInsets.symmetric(
    horizontal: MediaQuery.sizeOf(context).width * 4 / 100);
//padding
EdgeInsets edgeInsetsAll(BuildContext context, double number) =>
    EdgeInsets.all(MediaQuery.sizeOf(context).width * number / 100);
EdgeInsets edgeInsetsSym(BuildContext context, double h, double v) =>
    EdgeInsets.symmetric(
        horizontal: MediaQuery.sizeOf(context).width * h / 100,
        vertical: MediaQuery.sizeOf(context).width * v / 100);
EdgeInsets edgeInsetsLeft(BuildContext context, double number) =>
    EdgeInsets.only(left: MediaQuery.sizeOf(context).width * number / 100);
EdgeInsets edgeInsetsRight(BuildContext context, double number) =>
    EdgeInsets.only(right: MediaQuery.sizeOf(context).width * number / 100);
EdgeInsets edgeInsetsTop(BuildContext context, double number) =>
    EdgeInsets.only(top: MediaQuery.sizeOf(context).width * number / 100);
EdgeInsets edgeInsetsBottom(BuildContext context, double number) =>
    EdgeInsets.only(bottom: MediaQuery.sizeOf(context).width * number / 100);
EdgeInsets edgeInsetsOnly(
  BuildContext context,
  double left,
  double right,
  double top,
  double bottom,
) =>
    EdgeInsets.only(
      left: MediaQuery.sizeOf(context).width * left / 100,
      right: MediaQuery.sizeOf(context).width * right / 100,
      top: MediaQuery.sizeOf(context).width * top / 100,
      bottom: MediaQuery.sizeOf(context).width * bottom / 100,
    );

//==========radius=========================
BorderRadius radiusAll(BuildContext context, double number) =>
    BorderRadius.circular(MediaQuery.sizeOf(context).width * number / 100);
BorderRadius radiusTopleft(BuildContext context, double number) =>
    BorderRadius.only(
        topLeft:
            Radius.circular(MediaQuery.sizeOf(context).width * number / 100));
BorderRadius radiusTopRight(BuildContext context, double number) =>
    BorderRadius.only(
        topRight:
            Radius.circular(MediaQuery.sizeOf(context).width * number / 100));
BorderRadius radiusBottomRight(BuildContext context, double number) =>
    BorderRadius.only(
        bottomRight:
            Radius.circular(MediaQuery.sizeOf(context).width * number / 100));
BorderRadius radiusBottomLeft(BuildContext context, double number) =>
    BorderRadius.only(
        bottomLeft:
            Radius.circular(MediaQuery.sizeOf(context).width * number / 100));
BorderRadius radiusOnly(BuildContext context, double topLeft, double topRight,
        double bottomLeft, double bottomRight) =>
    BorderRadius.only(
      topLeft:
          Radius.circular(MediaQuery.sizeOf(context).width * topLeft / 100),
      topRight:
          Radius.circular(MediaQuery.sizeOf(context).width * topRight / 100),
      bottomLeft:
          Radius.circular(MediaQuery.sizeOf(context).width * bottomLeft / 100),
      bottomRight:
          Radius.circular(MediaQuery.sizeOf(context).width * bottomRight / 100),
    );
