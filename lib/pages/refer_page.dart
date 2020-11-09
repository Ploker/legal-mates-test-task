import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:legal_mates/widgets/appbar.dart';
import 'package:legal_mates/widgets/bottomNavigationBar.dart';
import 'package:legal_mates/widgets/case.dart';
import 'package:legal_mates/widgets/filter.dart';

class ReferPage extends StatefulWidget {
  @override
  _ReferPageState createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  int countCase = 0;

  _addCase() {
    setState(() {
      countCase++;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
      ),
    );
    return Scaffold(
      appBar: appBar(context, "Legal Mates"),
      body: SafeArea(
        child: ListView(
          children: [
            FilterWidget(),
            countCase > 0
                ? ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: countCase,
                    itemBuilder: (context, index) {
                      return CaseWidget();
                    },
                  )
                : Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        SizedBox(height: 60),
                        Image.asset('assets/lawyer.png'),
                        SizedBox(height: 30),
                        Text(
                          'Create your',
                          style: TextStyle(
                            color: Color(0xff0D2834).withOpacity(0.6),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'first case',
                          style: TextStyle(
                            color: Color(0xff0D2834).withOpacity(0.6),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 60),
                      ],
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addCase();
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xff21CA7C),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
