import 'package:flutter/material.dart';
import 'package:v_room_app/screens/details_home_tab.dart';
import 'package:v_room_app/screens/widgets/custom_appbar.dart';
import 'package:v_room_app/utils/ColorsUtils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Details extends StatefulWidget {
  final int resturantId;

  const Details({Key key, this.resturantId}) : super(key: key);
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    DetailsHomeTab(),
    Icon(Icons.access_time),
    Icon(Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    print(widget.resturantId);
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: ColorsUtils.filledColor,
      appBar: CustomAppBar(
        title: '',
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.mail_outline_outlined,
                color: ColorsUtils.whiteColor,
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.list,
                color: ColorsUtils.whiteColor,
              )),
        ],
      ),
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, //New
        iconSize: 35.sp,
        selectedItemColor: ColorsUtils.orangeColor,
        unselectedItemColor: ColorsUtils.greyTextColor,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.house_rounded,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
