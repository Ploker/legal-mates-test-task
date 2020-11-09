import 'package:flutter/material.dart';

class bottomNavigationBar extends StatefulWidget {
  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<bottomNavigationBar> {
  int countMessage = 12;

  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text('Search'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          title: Text('Refer'),
        ),
        BottomNavigationBarItem(
          icon: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Icon(Icons.mail_outline),
              countMessage != 0
                  ? Positioned(
                      top: -4.0,
                      right: -10.0,
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
          title: Text('Massages'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xff0D2834),
      unselectedItemColor: Color(0xff0D2834).withOpacity(0.38),
      showUnselectedLabels: true,
      // iconSize: 20,
      onTap: _onItemTapped,
    );
  }
}
