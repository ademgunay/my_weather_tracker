class LocationData {
  String? country;
  String? regionName;
  double? lat;
  double? lon;

  LocationData({this.country, this.regionName});

  LocationData.fromJson(dynamic json) {
    country = json['country'];
    regionName = json['regionName'];
    lat = json['lat'];
    lon = json['lon'];
  }
}