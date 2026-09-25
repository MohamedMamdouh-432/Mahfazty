import 'package:flutter/material.dart';

final users = [
  {
    "name": "Mohamed",
    "language": "arabic",
    "identifier": "dev",
    "password": "123",
  },
];

final accounts = [
  {
    "userId": 1,
    "name": "wallet",
    "type": "cash",
    "balance": 7500,
    "currency": "EGP",
    "isActive": 1,
  },
];

final cats = [
  // =========================
  // INCOME
  // =========================
  {
    'name': 'Salary',
    'type': 'income',
    'icon': Icons.payments.codePoint,
    'color': Colors.green.toARGB32(),
    'description': 'Monthly salary or wages',
  },
  {
    'name': 'Freelance',
    'type': 'income',
    'icon': Icons.work_outline.codePoint,
    'color': Colors.blue.toARGB32(),
    'description': 'Income from freelance work',
  },
  {
    'name': 'Business',
    'type': 'income',
    'icon': Icons.business.codePoint,
    'color': Colors.purple.toARGB32(),
    'description': 'Income from business activities',
  },
  {
    'name': 'Investment',
    'type': 'income',
    'icon': Icons.trending_up.codePoint,
    'color': Colors.orange.toARGB32(),
    'description': 'Income from investments',
  },
  {
    'name': 'Gift',
    'type': 'income',
    'icon': Icons.card_giftcard.codePoint,
    'color': Colors.pink.toARGB32(),
    'description': 'Money received as a gift',
  },
  {
    'name': 'Bonus',
    'type': 'income',
    'icon': Icons.stars.codePoint,
    'color': Colors.cyan.toARGB32(),
    'description': 'Bonuses and rewards',
  },
  {
    'name': 'Other Income',
    'type': 'income',
    'icon': Icons.attach_money.codePoint,
    'color': Colors.blueGrey.toARGB32(),
    'description': 'Other sources of income',
  },

  // =========================
  // EXPENSE
  // =========================
  {
    'name': 'Food & Dining',
    'type': 'expense',
    'icon': Icons.restaurant.codePoint,
    'color': Colors.deepOrange.toARGB32(),
    'description': 'Restaurants, meals and food',
  },
  {
    'name': 'Transportation',
    'type': 'expense',
    'icon': Icons.directions_car.codePoint,
    'color': Colors.indigo.toARGB32(),
    'description': 'Fuel, taxis, public transportation and commuting',
  },
  {
    'name': 'Shopping',
    'type': 'expense',
    'icon': Icons.shopping_cart.codePoint,
    'color': Colors.pink.toARGB32(),
    'description': 'Clothes, electronics and other shopping',
  },
  {
    'name': 'Bills & Utilities',
    'type': 'expense',
    'icon': Icons.receipt_long.codePoint,
    'color': Colors.brown.toARGB32(),
    'description': 'Electricity, water, gas, internet and bills',
  },
  {
    'name': 'Rent',
    'type': 'expense',
    'icon': Icons.home.codePoint,
    'color': Colors.deepPurple.toARGB32(),
    'description': 'House or apartment rent',
  },
  {
    'name': 'Healthcare',
    'type': 'expense',
    'icon': Icons.local_hospital.codePoint,
    'color': Colors.red.toARGB32(),
    'description': 'Medical expenses, medicine and healthcare',
  },
  {
    'name': 'Entertainment',
    'type': 'expense',
    'icon': Icons.movie.codePoint,
    'color': Colors.purple.toARGB32(),
    'description': 'Movies, games and entertainment',
  },
  {
    'name': 'Education',
    'type': 'expense',
    'icon': Icons.school.codePoint,
    'color': Colors.teal.toARGB32(),
    'description': 'Courses, books and education',
  },
  {
    'name': 'Subscriptions',
    'type': 'expense',
    'icon': Icons.subscriptions.codePoint,
    'color': Colors.orange.toARGB32(),
    'description': 'Monthly and yearly subscriptions',
  },
  {
    'name': 'Travel',
    'type': 'expense',
    'icon': Icons.flight.codePoint,
    'color': Colors.lightBlue.toARGB32(),
    'description': 'Trips, hotels and travel expenses',
  },
  {
    'name': 'Personal Care',
    'type': 'expense',
    'icon': Icons.spa.codePoint,
    'color': Colors.lightGreen.toARGB32(),
    'description': 'Haircuts, grooming and personal care',
  },
  {
    'name': 'Gifts & Donations',
    'type': 'expense',
    'icon': Icons.volunteer_activism.codePoint,
    'color': Colors.pink.toARGB32(),
    'description': 'Gifts, donations and charitable expenses',
  },
  {
    'name': 'Other Expense',
    'type': 'expense',
    'icon': Icons.more_horiz.codePoint,
    'color': Colors.blueGrey.toARGB32(),
    'description': 'Other expenses',
  },
];

final trans = [
  {
    "userId": 1,
    "accountId": 1,
    "categoryId": 8,
    "type": "expense",
    "amount": 220,
  },
  {
    "userId": 1,
    "accountId": 1,
    "categoryId": 2,
    "type": "income",
    "amount": 1500,
  }
];
