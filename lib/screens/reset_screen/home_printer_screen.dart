import 'package:air_point/screens/reset_screen/print_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePrinterScreen extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {'title': 'فرشة اواني', 'price': 25, 'qty': 2},
    {'title': 'مروحة ستاند ', 'price': 430, 'qty': 5},
    {'title': 'مكنة قهوة', 'price': 1800, 'qty': 1},
    {'title': 'مروحة حائط', 'price': 1850, 'qty': 5},
    {'title': 'عجانه الماني 2000 وات', 'price': 1850, 'qty': 3},
  ];

  final f = NumberFormat("\$###,###.00", "en_US");

  @override
  Widget build(BuildContext context) {
    int _total = 0;
    _total = data.map((e) => e['price'] * e['qty']).reduce(
          (value, element) => value + element,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Pos -  Printer'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (c, i) {
                return ListTile(
                  title: Text(
                    data[i]['title'].toString(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    "${f.format(data[i]['price'])} ",
                  ),
                  trailing: Text(
                    f.format(
                      data[i]['price'] * data[i]['qty'],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Text(
                  "Total: ${f.format(_total)}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 80,
                ),
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PrintPage(data),
                        ),
                      );
                    },
                    icon: Icon(Icons.print),
                    label: Text('Print'),
                    style: TextButton.styleFrom(
                        primary: Colors.white, backgroundColor: Colors.green),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}