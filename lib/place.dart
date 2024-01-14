// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {
  final String id;
  final LatLng latLng;
  final String name;
  final Pages category;
  final String? description;
  final double price;
  final bool handicapped;

  const Place({
    required this.id,
    required this.latLng,
    required this.name,
    required this.category,
    this.description,
    this.price = 0,
    this.handicapped = false,
  });

  double get latitude => latLng.latitude;

  double get longitude => latLng.longitude;

  Place copyWith({
    String? id,
    LatLng? latLng,
    String? name,
    Pages? category,
    String? description,
  }) {
    return Place(
      price: price ?? this.price,
      handicapped: handicapped ?? this.handicapped,
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Place &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          latLng == other.latLng &&
          name == other.name &&
          category == other.category &&
          description == other.description;

  @override
  int get hashCode =>
      id.hashCode ^
      latLng.hashCode ^
      name.hashCode ^
      category.hashCode ^
      description.hashCode;
}

enum Pages {
  parking,
  stations,
  information,
  hours,
}




