import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:mahfazty/core/data/enums/category_type.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final CategoryType type;
  final String? parentId;
  final IconData? icon;
  final Color? color;
  final String? description;

  const Category({
    required this.id,
    required this.name,
    required this.type,
    this.parentId,
    this.icon,
    this.color,
    this.description,
  });

  static final empty = Category(
    id: '',
    name: '',
    type: CategoryType.expense,
  );

  Category copyWith({
    String? id,
    String? name,
    CategoryType? type,
    String? parentId,
    IconData? icon,
    Color? color,
    String? description,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      parentId: parentId ?? this.parentId,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      description: description ?? this.description,
    );
  }
  
  factory Category.fromJson(Map<String, dynamic> jsonData) => Category(
    id: jsonData['id'].toString(),
    name: jsonData['name'],
    type: CategoryType.values.byName(jsonData['type']),
    icon: IconData(
      jsonData['icon'] as int,
      fontFamily: 'MaterialIcons',
    ),
    color: Color(jsonData['color'] as int),
    description: jsonData['description'],
  );

  @override
  List<Object> get props {
    return [
      id,
      name,
      type,
      parentId ?? '',
      icon ?? IconData(0),
      color ?? Color(0xffffffff),
      description ?? '',
    ];
  }
}
