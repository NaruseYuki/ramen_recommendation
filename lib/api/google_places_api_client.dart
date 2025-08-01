import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:ramen_recommendation/api/responses/get_place_details_response.dart';
import 'package:ramen_recommendation/api/responses/search_ramen_places_response.dart';

part 'google_places_api_client.g.dart';

@RestApi(baseUrl: "https://places.googleapis.com/v1/")
abstract class GooglePlacesApiClient {
  factory GooglePlacesApiClient(Dio dio, {String baseUrl}) = _GooglePlacesApiClient;

  @POST("places:searchText")
  Future<SearchRamenPlacesResponse> searchRamenPlaces(
    @Body() Map<String, dynamic> requestBody,
    @Header("X-Goog-Api-Key") String apiKey,
    @Header("X-Goog-FieldMask") String fieldMask,
    @Header("Content-Type") String contentType);

  @GET("places/{placeId}")
  Future<GetPlaceDetailsResponse> getPlaceDetails(
    @Path("placeId") String placeId,
    @Queries() Map<String, dynamic> queryParams,
    @Header("X-Goog-Api-Key") String apiKey,
    @Header("Content-Type") String contentType);
}
