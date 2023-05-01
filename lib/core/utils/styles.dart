import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/constants.dart';

abstract class Styles {
  static const appLogo = TextStyle(
    fontSize: 30,
    fontFamily: kFontControwell,
  );

  //? Montserrat
  static final textStyle18 = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  //? Lora
  static final textStyle14 = GoogleFonts.lora(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );
  static final textStyle16 = GoogleFonts.lora(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final textStyle30 = GoogleFonts.lora(
    fontSize: 30,
    fontWeight: FontWeight.normal,
  );
  static final textStyle20 = GoogleFonts.lora(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );
}
