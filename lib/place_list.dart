// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'place.dart';
import 'place_tracker_app.dart';

class PlaceList extends StatefulWidget {
  const PlaceList({super.key});

  @override
  State<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<AppState>(context);
    return Column(
      children: [
        _ListCategoryButtonBar(
          selectedCategory: state.selectedCategory,
          onCategoryChanged: (value) => _onCategoryChanged(value),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 8.0),
            controller: _scrollController,
            shrinkWrap: true,
            children: state.places
                .where((place) => place.category == state.selectedCategory)
                .map((place) => _PlaceListTile(place: place))
                .toList(),
          ),
        ),
      ],
    );
  }

  void _onCategoryChanged(Pages newCategory) {
    _scrollController.jumpTo(0.0);
    Provider.of<AppState>(context, listen: false)
        .setSelectedCategory(newCategory);
  }
}

class _CategoryButton extends StatelessWidget {
  final Pages category;

  final bool selected;
  final ValueChanged<Pages> onCategoryChanged;

  const _CategoryButton({
    required this.category,
    required this.selected,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
  final buttonText = (() {
    switch (category) {
      case Pages.information:
        return 'Information';
      case  Pages.hours:
        return 'Hours';
      case Pages.parking:
        return 'Parking Lots';
      default:
        return '';
    }
  })();

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: selected ? const Color(0xff741D4A) : Colors.transparent,
          ),
        ),
      ),
      child: ButtonTheme(
        height: 50.0,
        child: TextButton(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: selected ? 20.0 : 18.0,
              color: selected ? const Color(0xff741D4A): Colors.black87,
            ),
          ),
          onPressed: () => onCategoryChanged(category),
        ),
      ),
    );
  }
}

class _ListCategoryButtonBar extends StatelessWidget {
  final Pages selectedCategory;

  final ValueChanged<Pages> onCategoryChanged;

  const _ListCategoryButtonBar({
    required this.selectedCategory,
    required this.onCategoryChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _CategoryButton(
          category: Pages.information,
          selected: selectedCategory == Pages.information,
          onCategoryChanged: onCategoryChanged,
        ),
        _CategoryButton(
          category: Pages.hours,
          selected: selectedCategory == Pages.hours,
          onCategoryChanged: onCategoryChanged,
        ),
        _CategoryButton(
          category: Pages.parking,
          selected: selectedCategory == Pages.parking,
          onCategoryChanged: onCategoryChanged,
        ),
      ],
    );
  }
}

class _PlaceListTile extends StatelessWidget {
  final Place place;

  const _PlaceListTile({
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/place/${place.id}'),
      child: Container(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              place.name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              maxLines: 3,
            ),
            // Row(
            //   children: List.generate(5, (index) {
            //     return Icon(
            //       Icons.star,
            //       size: 28.0,
            //       color: place.starRating > index
            //           ? Colors.amber
            //           : Colors.grey[400],
            //     );
            //   }).toList(),
            // ),
            Text(
              place.description ?? '',
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 16.0),
            Divider(
              height: 2.0,
              color: Colors.grey[700],
            ),
          ],
        ),
      ),
    );
  }
}



