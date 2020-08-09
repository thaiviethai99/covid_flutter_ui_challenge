import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/result.dart';
import '../../ui/helper/app_colors.dart';
import '../../ui/helper/app_strings.dart';
import 'package:intl/intl.dart';
class TopContainer extends StatefulWidget {
  final List<CountryResult> countryList;

  const TopContainer({
    Key key,
    @required this.countryList,
  }) : super(key: key);

  @override
  _TopContainerState createState() => _TopContainerState();
}

class _TopContainerState extends State<TopContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Container(
        height: MediaQuery.of(context).size.height * .40,
        width: MediaQuery.of(context).size.width * .9,
        decoration: _containerBoxDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 15, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(left: 20.0), child: Text(AppStrings.kureselDurumilk5, style: _headerTextStyle)),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Table(
                  children: <TableRow>[
                    TableRow(children: [
                      TableCell(
                        child: Container(
                          height: MediaQuery.of(context).size.height / 19,
                        ),
                      ),
                      TableCell(
                        child: Container(
                            height: MediaQuery.of(context).size.height / 19,
                            child: Center(child: _casesRow(FontAwesomeIcons.procedures, AppColors.colorDarkBlue))),
                      ),
                      TableCell(
                        child: Container(
                            height: MediaQuery.of(context).size.height / 19,
                            child: Center(child: _casesRow(FontAwesomeIcons.procedures, AppColors.colorDarkRed))),
                      ),
                      TableCell(
                        child: Container(height: MediaQuery.of(context).size.height / 19, child: Center(child: _casesRow(Icons.add_box, AppColors.colorGreen))),
                      ),
                    ]),
                    _countryStatusCell(0),
                    _countryStatusCell(1),
                    _countryStatusCell(2),
                    _countryStatusCell(3),
                    _countryStatusCell(4),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TableRow _countryStatusCell(int index) {
    final formatter = NumberFormat.currency(locale: 'vi',symbol: '');
    int totalCases = int.parse(widget.countryList[index].totalCases.toString());
    String totalCasesFormat= formatter.format(totalCases);

    int totalDeaths = int.parse(widget.countryList[index].totalDeaths.toString());
    String totalDeathsFormat= formatter.format(totalDeaths);

    int totalRecovered = int.parse(widget.countryList[index].totalRecovered.toString());
    String totalRecoveredFormat= formatter.format(totalRecovered);

    return TableRow(children: <Widget>[
      TableCell(
        child: Container(
            padding: EdgeInsets.only(left: 20.0),
            alignment: Alignment.centerLeft,
            height: MediaQuery.of(context).size.height / 19,
            child: Text((widget.countryList[index].countryName), style: _countryNameTextStyle)),
        verticalAlignment: TableCellVerticalAlignment.middle,
      ),
      TableCell(
          child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 19,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(totalCasesFormat, style: _countryCaseTextStyle(AppColors.colorDarkBlue)),
            Text(AppStrings.vaka, style: _countryCaseInfoTextStyle(AppColors.colorDarkBlue))
          ],
        ),
      )),
      TableCell(
          child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 19,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(totalDeathsFormat, style: _countryCaseTextStyle(AppColors.colorDarkRed)),
            Text(AppStrings.vefat, style: _countryCaseInfoTextStyle(AppColors.colorDarkRed))
          ],
        ),
      )),
      TableCell(
          child: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height / 19,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(totalRecoveredFormat, style: _countryCaseTextStyle(AppColors.colorGreen)),
            Text(AppStrings.iyilesen, style: _countryCaseInfoTextStyle(AppColors.colorGreen))
          ],
        ),
      )),
    ]);
  }

  BoxDecoration get _containerBoxDecoration => BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 8)]);
  TextStyle get _headerTextStyle => GoogleFonts.openSans(color: AppColors.colorDarkBlue, letterSpacing: 0.68, fontWeight: FontWeight.w700, fontSize: 14);
  TextStyle get _countryNameTextStyle => GoogleFonts.openSans(color: AppColors.colorDarkRed, fontSize: 10, fontWeight: FontWeight.bold);
  TextStyle _countryCaseTextStyle(Color _color) => GoogleFonts.openSans(color: _color, fontSize: 14, fontWeight: FontWeight.bold);
  TextStyle _countryCaseInfoTextStyle(Color _color) => GoogleFonts.openSans(color: _color, fontSize: 10, fontWeight: FontWeight.w600);
  Widget _casesRow(IconData _icon, Color _color) => FaIcon(_icon, size: 20, color: _color);
}
