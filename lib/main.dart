import 'package:arqueo_caja/config/theme.dart';
import 'package:arqueo_caja/pages/add_cashcount_page.dart';
import 'package:arqueo_caja/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols.dart';
import 'package:intl/number_symbols_data.dart';

void main() {
  Intl.defaultLocale = 'es_BO';
  initializeDateFormatting('es_BO', null);

  numberFormatSymbols['es_BO'] = const NumberSymbols(
    NAME: 'es_BO',
    DECIMAL_SEP: ',',
    GROUP_SEP: '.',
    PERCENT: '%',
    ZERO_DIGIT: '0',
    PLUS_SIGN: '+',
    MINUS_SIGN: '-',
    EXP_SYMBOL: 'E',
    PERMILL: '‰',
    INFINITY: '∞',
    NAN: 'NaN',
    DECIMAL_PATTERN: '#,##0.###',
    SCIENTIFIC_PATTERN: '#E0',
    PERCENT_PATTERN: '#,##0%',
    CURRENCY_PATTERN: '¤#,##0.00',
    DEF_CURRENCY_CODE: 'Bs ',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arqueo de Caja',
      theme: ThemeConfig.getTheme(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/add': (context) => const AddCashCountPage(),
      },
    );
  }
}
