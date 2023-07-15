import 'package:bitcoin_tracker/providers/bitcoin_details_provider.dart';
import 'package:bitcoin_tracker/routes/routes.dart';
import 'package:bitcoin_tracker/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BitcoinDetailsProvider()),
      ],
      child: MaterialApp(
        title: StringUtils.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.teal[500],
          textTheme: const TextTheme(
            titleMedium: TextStyle(
              color: Colors.orange,
              fontWeight: FontWeight.w600,
              fontSize: 40.0
            )
          )
        ),
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RoutePath.home,
      ),
    );
  }
}
