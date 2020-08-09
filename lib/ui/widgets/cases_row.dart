import 'package:covid_19_tracker_in_flutter/ui/helper/app_colors.dart';
import 'package:covid_19_tracker_in_flutter/ui/helper/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
class CasesRow extends StatelessWidget {
  final int totalCases;
  final int totalDeaths;
  final int totalRecovered;
  final int totalActiveCases;

  const CasesRow({
    Key key,
    @required this.totalCases,
    @required this.totalDeaths,
    @required this.totalRecovered,
    @required this.totalActiveCases,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(locale: 'vi',symbol: '');
    String totalCasesFormat= formatter.format(totalCases);
    String totalDeathsFormat= formatter.format(totalDeaths);
    String totalRecoveredFormat= formatter.format(totalRecovered);
    String totalActiveCasesFormat= formatter.format(totalActiveCases);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorDarkBlue),
            Text(totalCasesFormat, style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, fontWeight: FontWeight.w800, fontSize: 17)),
            Text(AppStrings.vaka, style: GoogleFonts.openSans(color: AppColors.colorDarkBlue, fontWeight: FontWeight.w700, fontSize: 14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorDarkRed),
            Text(totalDeathsFormat, style: GoogleFonts.openSans(color: AppColors.colorDarkRed, fontWeight: FontWeight.w800, fontSize: 17)),
            Text(AppStrings.vefat, style: GoogleFonts.openSans(color: AppColors.colorDarkRed, fontWeight: FontWeight.w700, fontSize: 14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.add_box, size: 20, color: AppColors.colorGreen),
            Text(totalRecoveredFormat, style: GoogleFonts.openSans(color: AppColors.colorGreen, fontWeight: FontWeight.w800, fontSize: 17)),
            Text(AppStrings.iyilesen, style: GoogleFonts.openSans(color: AppColors.colorGreen, fontWeight: FontWeight.w700, fontSize: 14)),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FaIcon(FontAwesomeIcons.procedures, size: 20, color: AppColors.colorPrimary),
            Text(totalActiveCasesFormat, style: GoogleFonts.openSans(color: AppColors.colorPrimary, fontWeight: FontWeight.w800, fontSize: 17)),
            Text(AppStrings.aktifVaka, style: GoogleFonts.openSans(color: AppColors.colorPrimary, fontWeight: FontWeight.w700, fontSize: 14)),
          ],
        )
      ],
    );
  }
}
