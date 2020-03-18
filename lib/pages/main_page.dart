import 'package:dashboard/classes/corona_result.dart';
import 'package:dashboard/utils/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'shop_items_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Data _coronaData = new Data();

  final List<List<double>> charts = [
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ]
  ];

  static final List<String> chartDropdownItems = [
    'Last 7 days',
    'Last month',
    'Last year'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  void initState() {
    super.initState();

    // call to get data from rest api
    _fetchCoronaCounts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 5.0,
          backgroundColor: Colors.white,
          title: Text('COVID19' ' Updates - Sri Lanka',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0)),
          actions: <Widget>[
            // Container(
            //   margin: EdgeInsets.only(right: 8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: <Widget>[
            //       Text(_coronaData.updateDateTime,
            //           style: TextStyle(
            //               color: Colors.blue,
            //               fontWeight: FontWeight.w700,
            //               fontSize: 14.0)),
            //     ],
            //   ),
            // )
          ],
        ),
        body: StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          children: <Widget>[
            // time
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                              'Sri Lanka Health Promotion Bureau - @ ' +
                                  _coronaData.updateDateTime,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.0)),
                        ],
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 20),
            // new cases
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Material(
                          color: Colors.blue[600],
                          shape: CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.local_hospital,
                                color: Colors.white, size: 24.0),
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('New Cases',
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0)),
                      Text(_coronaData.localNewCases.toString(),
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontWeight: FontWeight.w900,
                              fontSize: 36.0))
                    ]),
              ),
            ),

            // new deths
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Material(
                          color: Colors.red[600],
                          shape: CircleBorder(),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.airline_seat_flat,
                                color: Colors.white, size: 24.0),
                          )),
                      Padding(padding: EdgeInsets.only(bottom: 16.0)),
                      Text('New Deaths',
                          style: TextStyle(
                              color: Colors.red[700],
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0)),
                      Text(_coronaData.localNewDeaths.toString(),
                          style: TextStyle(
                              color: Colors.red[700],
                              fontWeight: FontWeight.w900,
                              fontSize: 36.0))
                    ]),
              ),
            ),
            SizedBox(height: 20),

            // total cases
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Total Cases',
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0)),
                          Text(_coronaData.localTotalCases.toString(),
                              style: TextStyle(
                                  color: Colors.blue[700],
                                  fontWeight: FontWeight.w900,
                                  fontSize: 36.0))
                        ],
                      ),
                      Material(
                          color: Colors.blue[700],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.local_hospital,
                                color: Colors.white, size: 30.0),
                          )))
                    ]),
              ),
            ),

            // _buildTile(
            //   Padding(
            //       padding: const EdgeInsets.all(24.0),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: <Widget>[
            //                   Text('Grid Of Total Cases',
            //                       style: TextStyle(color: Colors.green)),
            //                   Text('\$16K',
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w700,
            //                           fontSize: 34.0)),
            //                 ],
            //               ),
            //               DropdownButton(
            //                   isDense: true,
            //                   value: actualDropdown,
            //                   onChanged: (String value) => setState(() {
            //                         actualDropdown = value;
            //                         actualChart = chartDropdownItems
            //                             .indexOf(value); // Refresh the chart
            //                       }),
            //                   items: chartDropdownItems.map((String title) {
            //                     return DropdownMenuItem(
            //                       value: title,
            //                       child: Text(title,
            //                           style: TextStyle(
            //                               color: Colors.blue,
            //                               fontWeight: FontWeight.w400,
            //                               fontSize: 14.0)),
            //                     );
            //                   }).toList())
            //             ],
            //           ),
            //           Padding(padding: EdgeInsets.only(bottom: 4.0)),
            //           Sparkline(
            //             data: charts[actualChart],
            //             lineWidth: 5.0,
            //             lineColor: Colors.greenAccent,
            //           )
            //         ],
            //       )),
            // ),

            SizedBox(height: 20),

            // total deths
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Total Deaths',
                              style: TextStyle(
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0)),
                          Text(_coronaData.localNewDeaths.toString(),
                              style: TextStyle(
                                  color: Colors.red[700],
                                  fontWeight: FontWeight.w900,
                                  fontSize: 36.0))
                        ],
                      ),
                      Material(
                          color: Colors.red[700],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.airline_seat_flat,
                                color: Colors.white, size: 30.0),
                          )))
                    ]),
              ),
            ),

            // _buildTile(
            //   Padding(
            //       padding: const EdgeInsets.all(24.0),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: <Widget>[
            //                   Text('Grid Of Total Cases',
            //                       style: TextStyle(color: Colors.green)),
            //                   Text('\$16K',
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w700,
            //                           fontSize: 34.0)),
            //                 ],
            //               ),
            //               DropdownButton(
            //                   isDense: true,
            //                   value: actualDropdown,
            //                   onChanged: (String value) => setState(() {
            //                         actualDropdown = value;
            //                         actualChart = chartDropdownItems
            //                             .indexOf(value); // Refresh the chart
            //                       }),
            //                   items: chartDropdownItems.map((String title) {
            //                     return DropdownMenuItem(
            //                       value: title,
            //                       child: Text(title,
            //                           style: TextStyle(
            //                               color: Colors.blue,
            //                               fontWeight: FontWeight.w400,
            //                               fontSize: 14.0)),
            //                     );
            //                   }).toList())
            //             ],
            //           ),
            //           Padding(padding: EdgeInsets.only(bottom: 4.0)),
            //           Sparkline(
            //             data: charts[actualChart],
            //             lineWidth: 5.0,
            //             lineColor: Colors.greenAccent,
            //           )
            //         ],
            //       )),
            // ),

            SizedBox(height: 20),
            // total recovered
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Total Recovered',
                              style: TextStyle(
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20.0)),
                          Text(_coronaData.localRecovered.toString(),
                              style: TextStyle(
                                  color: Colors.green[700],
                                  fontWeight: FontWeight.w900,
                                  fontSize: 36.0))
                        ],
                      ),
                      Material(
                          color: Colors.green[700],
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.accessibility_new,
                                color: Colors.white, size: 30.0),
                          )))
                    ]),
              ),
            ),

            // _buildTile(
            //   Padding(
            //       padding: const EdgeInsets.all(24.0),
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: <Widget>[
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: <Widget>[
            //               Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: <Widget>[
            //                   Text('Grid Of Total Cases',
            //                       style: TextStyle(color: Colors.green)),
            //                   Text('\$16K',
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w700,
            //                           fontSize: 34.0)),
            //                 ],
            //               ),
            //               DropdownButton(
            //                   isDense: true,
            //                   value: actualDropdown,
            //                   onChanged: (String value) => setState(() {
            //                         actualDropdown = value;
            //                         actualChart = chartDropdownItems
            //                             .indexOf(value); // Refresh the chart
            //                       }),
            //                   items: chartDropdownItems.map((String title) {
            //                     return DropdownMenuItem(
            //                       value: title,
            //                       child: Text(title,
            //                           style: TextStyle(
            //                               color: Colors.blue,
            //                               fontWeight: FontWeight.w400,
            //                               fontSize: 14.0)),
            //                     );
            //                   }).toList())
            //             ],
            //           ),
            //           Padding(padding: EdgeInsets.only(bottom: 4.0)),
            //           Sparkline(
            //             data: charts[actualChart],
            //             lineWidth: 5.0,
            //             lineColor: Colors.greenAccent,
            //           )
            //         ],
            //       )),
            // ),
            _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Shop Items',
                              style: TextStyle(color: Colors.redAccent)),
                          Text('173',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 34.0))
                        ],
                      ),
                      Material(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Icon(Icons.store,
                                color: Colors.white, size: 30.0),
                          )))
                    ]),
              ),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
            )
          ],
          staggeredTiles: [
            StaggeredTile.extent(2, 40.0),
            StaggeredTile.extent(2, 15.0),
            StaggeredTile.extent(1, 200.0),
            StaggeredTile.extent(1, 200.0),
            StaggeredTile.extent(2, 10.0),
            StaggeredTile.extent(2, 150.0),
            //StaggeredTile.extent(2, 220.0),
            StaggeredTile.extent(2, 10.0),
            StaggeredTile.extent(2, 150.0),
            //StaggeredTile.extent(2, 220.0),
            StaggeredTile.extent(2, 10.0),
            StaggeredTile.extent(2, 150.0),
            //StaggeredTile.extent(2, 220.0),
            //StaggeredTile.extent(2, 110.0),
          ],
        ));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }

  void _fetchCoronaCounts() {
    new ApiService().fetchCoronaData().then((Data value) {
      setState(() {
        this._coronaData = value;
      });
    });
  }
}
