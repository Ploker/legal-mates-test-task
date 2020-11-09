import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:legal_mates/pages/refer_page.dart';

void main() => runApp(LegalMates());

class LegalMates extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.workSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      title: 'LegalMates',
      initialRoute: '/refer',
      routes: {
        '/refer': (BuildContext context) => ReferPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
