import 'package:flutter/material.dart';
import 'package:ramen_recommendation/models/ramen_place.dart';
import 'package:ramen_recommendation/models/ramen_state.dart';
import 'package:ramen_recommendation/utils/color.dart';
import 'package:ramen_recommendation/views/screens/place_detail_screen.dart';

Widget customListView(
    RamenState<dynamic> state, void Function(RamenPlace) onTap) {
  return ListView.builder(
    itemCount: state.places.length,
    itemBuilder: (context, index) {
      final place = state.places[index] as RamenPlace; // RamenPlaceにキャスト
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          title: Text(place.displayName.text,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          leading: IconButton(
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
              )),
          subtitle: Text(place.address),
          trailing:
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          onTap: () {
            // 店舗詳細画面へ遷移
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
        ),
      );
    },
  );
}
