import 'package:flutter/material.dart';

class WebPageSelectionScreen extends StatefulWidget {
  const WebPageSelectionScreen({Key? key}) : super(key: key);

  @override
  _WebPageSelectionScreenState createState() => _WebPageSelectionScreenState();
}

class _WebPageSelectionScreenState extends State<WebPageSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white38,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Check this out',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 15, bottom: 15),
              child: ListTile(
                tileColor: Colors.white,
                leading: Image.asset(
                  'assets/icons/garg_logo.png',
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                ),
                title: Text(
                  'Garg Construction',
                  style: titleTextStyle(),
                ),
                onTap: () {
                  openWebView(urlToLoad: 'https://erpx1.wcsind.com/w1/admin/');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              child: ListTile(
                tileColor: Colors.white,
                leading: const Icon(
                  Icons.add,
                  size: 25,
                ),
                title: Text(
                  'WCS Loans',
                  style: titleTextStyle(),
                ),
                onTap: () {
                  openWebView(urlToLoad: 'https://erpx2.wcsind.com/w1/admin/');
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 15),
              child: ListTile(
                tileColor: Colors.white,
                leading: const Icon(
                  Icons.add,
                  size: 25,
                ),
                title: Text(
                  'MV Associates',
                  style: titleTextStyle(),
                ),
                onTap: () {
                  openWebView(urlToLoad: 'https://erpx3.wcsind.com/w1/admin/');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle titleTextStyle() {
    return const TextStyle(
      fontSize: 18,
      color: Colors.black,
    );
  }

  void openWebView({required String urlToLoad}) {

  }
}
