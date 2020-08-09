import '../ui/helper/app_colors.dart';
import '../ui/widgets/country_status.dart';
import '../ui/widgets/globe_status.dart';
import '../ui/widgets/top_5.dart';
import 'package:flutter/material.dart';
import '../models/result.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  Result _result = new Result();
  List<CountryResult> _countryResult = [];
  int vietNamTotalRecovered = 0;
  int vietNamTotalActiveCases = 0;
  int vietNamTotalDeaths = 0;
  int vietNamTotalCases = 0;
  String _countryName;

  @override
  void initState() {
    getData();
    getVietNamData();
    super.initState();
  }

  void getData() async {
    Result _temp = await getAllData();
    List<CountryResult> _countryTemp = await getAllCountriesData();
    setState(() {
      _result = _temp;
      _countryResult = _countryTemp;
      // Sıralama
      Comparator<CountryResult> comparator = (b, a) => a.totalCases.compareTo(b.totalCases);
      _countryResult.sort(comparator);
      getVietNamData();
    });
  }

  void getVietNamData() async {
    setState(() {
      _countryResult.forEach((element) {
        if ((element.countryName) == "Vietnam") {
          vietNamTotalCases = element.totalCases;
          vietNamTotalActiveCases = element.totalActiveCases;
          vietNamTotalDeaths = element.totalDeaths;
          vietNamTotalRecovered = element.totalRecovered;
          _countryName = "Viet Nam";
        }
      });
    });
  }

  void _onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    getData();
    getVietNamData();
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    if (_countryResult.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(60.0),
          child: LoadingIndicator(
            indicatorType: Indicator.ballScaleMultiple,
            color: AppColors.colorDarkRed,
          ),
        ),
      );
    } else {
      return SmartRefresher(
        enablePullDown: true,
        enablePullUp: false,
        onRefresh: _onRefresh,
        controller: _refreshController,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(padding: const EdgeInsets.only(top: 20.0), child: GlobeStatus(result: _result)),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: InkWell(
                  onTap: () => {},
                  child: CountryStatus(
                    countryName: _countryName,
                    totalActiveCases: vietNamTotalActiveCases,
                    totalCases: vietNamTotalCases,
                    totalDeaths: vietNamTotalDeaths,
                    totalRecovered: vietNamTotalRecovered,
                  ),
                ),
              ),
              TopContainer(countryList: _countryResult),
            ],
          ),
        ),
      );
    } // else
  }
}
