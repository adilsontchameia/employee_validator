import 'package:flutter/material.dart';
import 'package:inss_validator/screen/models/data/employee_data.dart';
import 'package:inss_validator/screen/models/employee_model.dart';
import 'package:inss_validator/utils/otp_widget.dart';
import 'package:inss_validator/utils/screen_proportion.dart';

class QueryInformationScreen extends StatefulWidget {
  const QueryInformationScreen({
    super.key,
  });

  @override
  State<QueryInformationScreen> createState() => _QueryInformationScreenState();
}

class _QueryInformationScreenState extends State<QueryInformationScreen> {
  final ScreenProportion proportion = ScreenProportion();
  final TextEditingController pin1 = TextEditingController();
  final TextEditingController pin2 = TextEditingController();
  final TextEditingController pin3 = TextEditingController();
  final TextEditingController pin4 = TextEditingController();
  late List<User> users;

  @override
  void initState() {
    super.initState();
    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              HeaderWidget(),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: proportion.screenSize(context).height * 0.030,
                    horizontal: proportion.screenSize(context).width * 0.010),
                child: Column(children: const [
                  Text('INSERT THE INSS BELOW IN ORDER TO GET ALL INFORMATION.',
                      style: TextStyle(
                          fontSize: 35,
                          color: Color.fromRGBO(14, 61, 97, 1),
                          fontWeight: FontWeight.bold)),
                  Text(
                      'IF YOU WANT TO GET THE INFORMATION ON TEXT FORMAT JUST ON TAP ON COPY BUTTON.',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 100, 98, 98),
                          fontWeight: FontWeight.bold)),
                ]),
              ),
              SizedBox(height: proportion.screenSize(context).height * 0.01),
              OTPFields(pin1: pin1, pin2: pin2, pin3: pin3, pin4: pin4),
              SizedBox(height: proportion.screenSize(context).height * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: proportion.screenSize(context).height * 0.030,
                    horizontal: proportion.screenSize(context).width * 0.010),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('QUERY RESULTS',
                        style: TextStyle(
                            fontSize: 35,
                            color: Color.fromRGBO(14, 61, 97, 1),
                            fontWeight: FontWeight.bold)),
                    BuildTable(),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: proportion.screenSize(context).width * 0.030,
                    vertical: proportion.screenSize(context).height * 0.07),
                child: SizedBox(
                    height: proportion.screenSize(context).height * 0.045,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(14, 61, 97, 1)),
                        onPressed: () {},
                        child: const Text('Search',
                            style: TextStyle(
                                fontSize: 35, fontWeight: FontWeight.bold)))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildTable extends StatefulWidget {
  const BuildTable({super.key});

  @override
  State<BuildTable> createState() => _BuildTableState();
}

class _BuildTableState extends State<BuildTable> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        // Datatable widget that have the property columns and rows.
        columns: const [
          // Set the name of the column
          DataColumn(
            label: Text('ID'),
          ),
          DataColumn(
            label: Text('Name'),
          ),
          DataColumn(
            label: Text('LastName'),
          ),
          DataColumn(
            label: Text('Age'),
          ),
        ],
        rows: const [
          // Set the values to the columns
          DataRow(cells: [
            DataCell(Text("1")),
            DataCell(Text("Alex")),
            DataCell(Text("Anderson")),
            DataCell(Text("18")),
          ]),
          DataRow(cells: [
            DataCell(Text("2")),
            DataCell(Text("John")),
            DataCell(Text("Anderson")),
            DataCell(Text("24")),
          ]),
        ],
        dividerThickness: 2,
        dataRowHeight: 70,
        dataTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
        dataRowColor: MaterialStateProperty.resolveWith(
            (states) => const Color.fromARGB(255, 220, 240, 255)),
        showBottomBorder: true,
        headingTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20.0),
        headingRowColor: MaterialStateProperty.resolveWith(
            (states) => const Color.fromRGBO(14, 61, 97, 1)),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  HeaderWidget({
    super.key,
  });
  final ScreenProportion proportion = ScreenProportion();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        height: proportion.screenSize(context).height * 0.35,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(14, 61, 97, 1),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100.0),
          ),
        ),
      ),
      Positioned(
        bottom: proportion.screenSize(context).height * 0.030,
        left: proportion.screenSize(context).width * 0.060,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('VALIDATION',
                style: TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10.0),
            Text(
                'Please check the last sync date in order to retrieve an updated information.',
                style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      Image.asset(
        'assets/HaloLogoWhite.png',
        height: proportion.screenSize(context).height * 0.32,
        width: proportion.screenSize(context).height * 0.28,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back,
                    color: Colors.white, size: 40)),
            Row(
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.home,
                            color: Colors.white, size: 35)),
                    const Text('Home',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(width: 20.0),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.settings,
                            color: Colors.white, size: 35)),
                    const Text('Settings',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
