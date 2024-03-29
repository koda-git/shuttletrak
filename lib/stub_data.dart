// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'place.dart';

class StubData {
  static const List<Place> places = [
    Place(
      id: '1',
      latLng: LatLng(43.26190473559966, -79.91758362123105),
      name: 'Parking Lot A',
      description:
          'Located between McMaster Divinity College and L.R.Wilson Hall.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '2',
      latLng: LatLng(43.26318471911702, -79.91630224146421),
      name: 'Parking Lot B',
      description:
          'Located at Stearn Dr, behind MUSC and Mills Memorial Library.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '3',
      latLng: LatLng(43.26415412074149, -79.91594564905269),
      name: 'Parking Lot C',
      description:
          'Located at Stearn Dr, behind Togo Salmon Hall.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '4',
      latLng: LatLng(43.26442018727773, -79.91507986874191),
      name: 'Parking Lot D',
      description:
          'Located next to Parking Lot C on Stearn Dr at Forsyth Ave.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '5',
      latLng: LatLng(43.262119939696674, -79.91687757775354),
      name: 'L.R. Wilson Underground Parking',
      description:
          'Located underground at L.R. Wilson Hall.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '6',
      latLng: LatLng(43.26615408870222, -79.91693340172318),
      name: 'Stadium Underground Parking',
      description:
          'Located under the stadium.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '7',
      latLng: LatLng(43.26637460044994, -79.9178326095654),
      name: 'Parking Lot G',
      description:
          'Located opposite Hedden Hall.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '8',
      latLng: LatLng(43.26766416354311, -79.91503914655935),
      name: 'Parking Lot H',
      description:
          'Located on Michell Cresent and north of Alumini Field.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '9',
      latLng: LatLng(43.2592131204764, -79.92212706190051),
      name: 'Parking Lot I',
      description:
          'Located next to the IT Building.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '10',
      latLng: LatLng(43.260098825856204, -79.92165171980258),
      name: 'Parking Lot J',
      description:
          'Located along College Crescent.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '11',
      latLng: LatLng(43.262991633591405, -79.92471932606887),
      name: 'Parking Lot K',
      description:
          'Located on Westaway Rd at Cootes Dr.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '12',
      latLng: LatLng(43.261470035867724, -79.92702681719976),
      name: 'Parking Lot L',
      description:
          'Located behind Campus Service Building.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '13',
      latLng: LatLng(43.26230751136846, -79.92954864032677),
      name: 'Parking Lot M',
      description:
          'Located at west of Westaway Rd, Ainsile Wood North.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '14',
      latLng: LatLng(43.26300450427156, -79.92773943689176),
      name: 'Parking Lot N',
      description:
          'Located next to Parking Lot M at Westaway Rd.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '15',
      latLng: LatLng(43.264411634469845, -79.92689124362114),
      name: 'Parking Lot P',
      description:
          'Located north of Parking Lot N.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '15',
      latLng: LatLng(43.264411634469845, -79.92689124362114),
      name: 'Parking Lot Q',
      description:
          'Located at President Dr in front of Bates Residence.',
      category: Pages.parking,
      price: 5.00,
      handicapped: true,
    ),
    Place(
      id: '16',
      latLng: LatLng(43.264085, -79.928189),
      name: 'Bus Stop 1',
      description:
          'Located for Parking Lot P (Eastbound/Westbound)',
      category: Pages.stations,
    ),
    Place(
      id: '17',
      latLng: LatLng(43.263143, -79.928595),
      name: 'Bus Stop 2',
      description:
          'Located for Parking Lot M (Eastbound)',
      category: Pages.stations,
    ),
    Place(
      id: '18',
      latLng: LatLng(43.259949, -79.922409),
      name: 'Bus Stop 3',
      description:
          'Located for Parking Lot I (Eastbound)',
      category: Pages.stations,
    ),
    Place(
      id: '19',
      latLng: LatLng(43.263221, -79.916961),
      name: 'Bus Stop 4',
      description:
          'Located for Parking Lot B (Eastbound/Westbound)',
      category: Pages.stations,
    ),
    Place(
      id: '20',
      latLng: LatLng(43.260091, -79.922053),
      name: 'Bus Stop 5',
      description:
          'Located for Parking Lot I (WestBound)',
      category: Pages.stations,
    ),
    Place(
      id: '21',
      latLng: LatLng(43.263152, -79.923156),
      name: 'Bus Stop 6',
      description:
          'Located for Bates Residence (Westbound)',
      category: Pages.stations,
    ),
    
  ];

  static const reviewStrings = [
    'My information place in Portland. The employees are wonderful and so is the food. I go here at least once a month!',
    'Staff was very friendly. Great atmosphere and good music. Would recommend.',
    'Best. Place. In. Town. Period.'
  ];
}
