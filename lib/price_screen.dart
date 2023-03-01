import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coinData.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  var selectedCurrency = 'INR';

  DropdownButton<String> androidPicker() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (int i = 0; i < currencyList.length; i++) {
      String currency = currencyList[i];
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
        value: selectedCurrency,
        items: dropDownItems,
        dropdownColor: Colors.grey[700],
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
          color: Colors.white,
          weight: 4,
        ),
        elevation: 20,
        onChanged: (String? value) {
          setState(() {
            selectedCurrency = value!;
          });
        });
  }

  CupertinoPicker iosPicker() {
    List<Text> cupertinoItems = [];
    for (int i = 0; i < currencyList.length; i++) {
      String currency = currencyList[i];
      Text x = Text(currency);
      cupertinoItems.add(x);
    }
    return CupertinoPicker(
      diameterRatio: 1.1,
      backgroundColor: Colors.grey[700],
      itemExtent: 32,
      useMagnifier: true,
      onSelectedItemChanged: (selectedIndex) {},
      children: cupertinoItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    androidPicker();
    iosPicker();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crypto Price Tracker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Card(
              color: Colors.lightBlue,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 125.0),
                child: Text(
                  '1 ETH: ',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Container(
            height: 120,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 25),
            color: Colors.grey[700],
            child: Platform.isIOS ? iosPicker() : androidPicker(),
          )
        ],
      ),
    );
  }
}
