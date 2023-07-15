import 'package:bitcoin_tracker/providers/bitcoin_details_provider.dart';
import 'package:bitcoin_tracker/utils/local_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Call function to get bitcoin price details
      final ref = Provider.of<BitcoinDetailsProvider>(context, listen: false);
      ref.getBitcoinDetails();
    });
  }

  // Display price
  priceDetails() {
    return Column(
      children: [
        // Display logo
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              LocalImages.bcLogo,
              height: 130.0,
              width: 130.0,
            ),
          ],
        ),
        // Display price
        Consumer<BitcoinDetailsProvider>(builder: (context, bcPro, child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  bcPro.price,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }

  // To change currency
  cupertinoCurrencyPicker() {
    return SizedBox(
      height: 200.0,
      child: Consumer<BitcoinDetailsProvider>(builder: (context, bcPro, child) {
        return CupertinoPicker(
          magnification: 1.2,
          itemExtent: 30,
          looping: false,
          onSelectedItemChanged: (int index) {
            final ref =
                Provider.of<BitcoinDetailsProvider>(context, listen: false);
            ref.updatePriceValue(index);
          },
          children: List.generate(bcPro.currencyList.length,
              (index) => Text(bcPro.currencyList[index].code)),
        );
      }),
    );
  }

  // App bar
  appBar() {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      elevation: 0.0,
    );
  }


  // Build method
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: priceDetails(),
      bottomNavigationBar: cupertinoCurrencyPicker(),
    );
  }
}
