import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kcolorScheme = ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 96, 59, 181));
var kdarkcolorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125));
void main(){
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(useMaterial3: true,
      colorScheme: kdarkcolorScheme,     
      ),
      theme: ThemeData().
      copyWith(useMaterial3: true,
      colorScheme: kcolorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kcolorScheme.onPrimaryContainer,
        foregroundColor: kcolorScheme.primaryContainer,
      ),
      cardTheme:  const CardTheme().copyWith(
        color: kcolorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 7,
        )
      ),
        elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kcolorScheme.primaryContainer,
          foregroundColor: kcolorScheme.onPrimaryContainer,
        )
      ),
      
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kcolorScheme.onSecondaryContainer,
          fontSize: 16,
        )
      )
    ),
    themeMode: ThemeMode.system,
      home: Expenses(),
    )
  );
}