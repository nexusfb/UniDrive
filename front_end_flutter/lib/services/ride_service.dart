// lib/services/ride_service.dart
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:uni_drive/models/ride.dart';
import 'package:uni_drive/models/search_model.dart';

import '../models/profile.dart';

part 'ride_service.g.dart';

@RestApi(baseUrl: "http://192.168.43.13:3000")
abstract class RideService {
  factory RideService() => _RideService(
        Dio(
          BaseOptions(
            headers: {
              'Authorization': 'b66c976d-606b-4d46-bbb2-f4b95d09a5d2',
            },
          ),
        ),
      );

  @GET("/rides")
  Future<List<Ride>> getRides({
    @Queries() required SearchModel searchModel,
  });

  @GET("/rides/{ride_id}")
  Future<Ride> getRide(@Path('ride_id') String id);

  @POST("/rides/{ride_id}/booking")
  Future<void> bookRide(@Path('ride_id') String id);

  @DELETE("/rides/{ride_id}/booking/{booking_id}")
  Future<void> cancelBooking(
      @Path('ride_id') String rideId, @Path('booking_id') String bookingId);

  @GET("/profile/{user_id}")
  Future<Profile> getProfile(@Path('user_id') String userId);

  @GET("/reverse_geocoding")
  Future<String> getFA(
      @Query('latitude') double latitude, @Query('longitude') double longitude);
}
