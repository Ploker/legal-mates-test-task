import 'package:flutter/material.dart';

PreferredSizeWidget appBar(context, title) {
  int countMessage = 12;
  return AppBar(
    backgroundColor: Color(0xff0D2834),
    title: Image.asset('assets/Logo.png'),
    actions: <Widget>[
      Stack(
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Color(0xffB6BFC2),
              ),
              onPressed: () {}),
          countMessage != 0
              ? Positioned(
                  right: 8,
                  top: 11,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Color(0xff21CA7C),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '$countMessage',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    ],
  );
}
