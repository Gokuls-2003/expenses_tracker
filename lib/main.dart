import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

var kcolorScheme = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));
var kdarkcolorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 5, 99, 125));
void main(){
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kdarkcolorScheme,
        cardTheme:  const CardTheme().copyWith(
        color: kdarkcolorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: kcolorScheme.primaryContainer,
          foregroundColor: kdarkcolorScheme.onPrimaryContainer,
        )
      ),
      ),
      theme: ThemeData().copyWith(useMaterial3: true,
      colorScheme: kcolorScheme,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: kcolorScheme.onPrimaryContainer,
        foregroundColor: kcolorScheme.primaryContainer,
      ),
      
      
      textTheme: ThemeData().textTheme.copyWith(
        titleLarge: TextStyle(
          fontWeight: FontWeight.bold,
          color: kcolorScheme.onSecondaryContainer,
          fontSize: 16  ,
        )
      )
    ),
      home: Expenses(),
    )
  );
}