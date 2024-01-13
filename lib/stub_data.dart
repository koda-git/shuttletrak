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
      category: PlaceCategory.information,
      //TODO change star rating to parking price
      starRating: 5,
    ),
    Place(
      id: '2',
      latLng: LatLng(43.26318471911702, -79.91630224146421),
      name: 'Parking Lot B',
      description:
          'Located at Stearn Dr, behind MUSC and Mills Memorial Library.',
      category: PlaceCategory.information,
      //TODO change star rating to parking price
      starRating: 5,
    ),
    Place(
      id: '3',
      latLng: LatLng(43.26415412074149, -79.91594564905269),
      name: 'Parking Lot C',
      description:
          'Located at Stearn Dr, behind Togo Salmon Hall.',
      category: PlaceCategory.information,
      //TODO change star rating to parking price
      starRating: 5,
    ),
    Place(
      id: '4',
      latLng: LatLng(43.26442018727773, -79.91507986874191),
      name: 'Parking Lot D',
      description:
          'Located next to Parking Lot C on Stearn Dr at Forsyth Ave.',
      category: PlaceCategory.information,
      //TODO change star rating to parking price
      starRating: 4,
    ),
    Place(
      id: '5',
      latLng: LatLng(43.262119939696674, -79.91687757775354),
      name: 'L.R. Wilson Underground Parking',
      description:
          'Located underground at L.R. Wilson Hall.',
      category: PlaceCategory.information,
      starRating: 4,
    ),
    Place(
      id: '6',
      latLng: LatLng(43.26615408870222, -79.91693340172318),
      name: 'Stadium Underground Parking',
      description:
          'Lively sports-bar chain dishing up wings & other American pub grub amid lots of large-screen TVs.',
      category: PlaceCategory.hours,
      starRating: 5,
    ),
    Place(
      id: '7',
      latLng: LatLng(45.416986, -122.743171),
      name: 'Chevys',
      description:
          'Lively, informal Mexican chain with a colorful, family-friendly setting plus tequilas & margaritas.',
      category: PlaceCategory.hours,
      starRating: 4,
    ),
    Place(
      id: '8',
      latLng: LatLng(45.430489, -122.831802),
      name: 'Cinetopia',
      description:
          'Moviegoers can take food from the on-site eatery to their seats, with table service in 21+ theaters.',
      category: PlaceCategory.hours,
      starRating: 4,
    ),
    Place(
      id: '9',
      latLng: LatLng(45.383030, -122.758372),
      name: 'Thai Cuisine',
      description:
          'Informal restaurant offering Thai standards in a modest setting, plus takeout & delivery.',
      category: PlaceCategory.hours,
      starRating: 4,
    ),
    Place(
      id: '10',
      latLng: LatLng(45.493321, -122.669330),
      name: 'The Old Spaghetti Factory',
      description:
          'Family-friendly chain eatery featuring traditional Italian entrees amid turn-of-the-century decor.',
      category: PlaceCategory.hours,
      starRating: 4,
    ),
    Place(
      id: '11',
      latLng: LatLng(45.548606, -122.675286),
      name: 'Mississippi Pizza',
      description:
          'Music, trivia & other all-ages events featured at pizzeria with lounge & vegan & gluten-free pies.',
      category: PlaceCategory.parking,
      starRating: 4,
    ),
    Place(
      id: '12',
      latLng: LatLng(45.420226, -122.740347),
      name: 'Oswego Grill',
      description:
          'Wood-grilled steakhouse informations served in a casual, romantic restaurant with a popular happy hour.',
      category: PlaceCategory.parking,
      starRating: 4,
    ),
    Place(
      id: '13',
      latLng: LatLng(45.541202, -122.676432),
      name: 'The Widmer Brothers Brewery',
      description:
          'Popular, enduring gastropub serving craft beers, sandwiches & eclectic entrees in a laid-back space.',
      category: PlaceCategory.parking,
      starRating: 4,
    ),
    Place(
      id: '14',
      latLng: LatLng(45.559783, -122.924103),
      name: 'TopGolf',
      description:
          'Sprawling entertainment venue with a high-tech driving range & swanky lounge with drinks & games.',
      category: PlaceCategory.parking,
      starRating: 5,
    ),
    Place(
      id: '15',
      latLng: LatLng(45.485612, -122.784733),
      name: 'Uwajimaya Beaverton',
      description:
          'Huge Asian grocery outpost stocking meats, produce & prepared foods plus gifts & home goods.',
      category: PlaceCategory.parking,
      starRating: 5,
    ),
  ];

  static const reviewStrings = [
    'My information place in Portland. The employees are wonderful and so is the food. I go here at least once a month!',
    'Staff was very friendly. Great atmosphere and good music. Would recommend.',
    'Best. Place. In. Town. Period.'
  ];
}
