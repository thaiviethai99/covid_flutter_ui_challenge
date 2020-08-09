import '../screens/home_screen.dart';
import '../ui/helper/app_colors.dart';
import '../ui/helper/app_strings.dart';
import '../ui/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeNavigator extends StatefulWidget {
  @override
  _HomeNavigatorState createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  int _currentIndex = 0;
  List<Widget> _pages = [HomeScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorLight,
      appBar: CovidAppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10)],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          child: BottomNavigationBar(
            onTap: (int val) {
              // if (val == _currentIndex) return;
              // setState(() {
              //   _currentIndex = val;
              // });
            },
            currentIndex: _currentIndex,
            unselectedLabelStyle: GoogleFonts.openSans(fontWeight: _labelFontStyle),
            unselectedIconTheme: IconThemeData(color: AppColors.colorBlue),
            selectedIconTheme: IconThemeData(color: AppColors.colorDarkBlue),
            selectedLabelStyle: GoogleFonts.openSans(fontWeight: _labelFontStyle),
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.thermometer), title: Text(AppStrings.sempton, style: _labelStyle)),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.clinicMedical), title: Text(AppStrings.anasayfa, style: _labelStyle)),
              BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.globeEurope), title: Text(AppStrings.dunya, style: _labelStyle)),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get _labelStyle => TextStyle(color: AppColors.colorDarkBlue);

  FontWeight get _labelFontStyle => FontWeight.bold;
}
