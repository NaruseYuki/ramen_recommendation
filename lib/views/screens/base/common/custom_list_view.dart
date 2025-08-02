import 'package:flutter/material.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';

Widget customListView(
    RamenState<dynamic> state, void Function(RamenPlace) onTap) {
  return GridView.builder(
    padding: const EdgeInsets.all(8.0),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
      childAspectRatio: 0.75,
    ),
    itemCount: state.places.length,
    itemBuilder: (context, index) {
      final place = state.places[index] as RamenPlace;
      final imageUrl = place.image?.photoUri;

      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: AppColor.primary,
            isScrollControlled: true,
            useSafeArea: true,
            showDragHandle: true,
            builder: (BuildContext context) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.9,
                child: PlaceDetailScreen(placeId: place.id),
              );
            },
          );
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 4.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: imageUrl != null && imageUrl.isNotEmpty
                    ? Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Image.asset(
                              'assets/images/ic_no_image.png',
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      )
                    : Image.asset(
                        'assets/images/ic_no_image.png',
                        fit: BoxFit.cover,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  place.displayName.text,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: () {
                    onTap(place);
                  },
                  icon: Icon(
                    state.favoritePlaceIds.contains(place.id)
                        ? Icons.star
                        : Icons.star_border,
                    color: state.favoritePlaceIds.contains(place.id)
                        ? Colors.amber
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
