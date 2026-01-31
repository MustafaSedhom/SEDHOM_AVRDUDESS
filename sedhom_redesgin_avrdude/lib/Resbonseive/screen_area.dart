import'package:flutter/material.dart';

class ScreenArea 
{
  static late double Width;
  static late double Height;

  static void init(BuildContext context)
  {
    Width = MediaQuery.of(context).size.width;
    Height = MediaQuery.of(context).size.height;
  } 
}