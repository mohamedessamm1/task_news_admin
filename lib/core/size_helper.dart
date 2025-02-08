import 'package:flutter/material.dart';

class SizeHelper {


  setSize({context, mobileSize, pcSize}){ {
    if(MediaQuery.of(context).size.width>=600) {
      return pcSize;
  }
  else {
    return mobileSize;
  }
  }}

}