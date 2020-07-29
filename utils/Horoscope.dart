// To parse this JSON data, do
//
//     final horoscope = horoscopeFromJson(jsonString);

import 'dart:convert';

Horoscope horoscopeFromJson(String str) => Horoscope.fromJson(json.decode(str));

String horoscopeToJson(Horoscope data) => json.encode(data.toJson());

class Horoscope {
  Horoscope({
    this.horoscope,
    this.matches,
    this.starRating,
  });

  String horoscope;
  Matches matches;
  StarRating starRating;

  factory Horoscope.fromJson(Map<String, dynamic> json) => Horoscope(
        horoscope: json["horoscope"],
        matches: Matches.fromJson(json["matches"]),
        starRating: StarRating.fromJson(json["star_rating"]),
      );

  Map<String, dynamic> toJson() => {
        "horoscope": horoscope,
        "matches": matches.toJson(),
        "star_rating": starRating.toJson(),
      };
}

class Matches {
  Matches({
    this.career,
    this.friendship,
    this.love,
  });

  String career;
  String friendship;
  String love;

  factory Matches.fromJson(Map<String, dynamic> json) => Matches(
        career: json["Career"],
        friendship: json["Friendship"],
        love: json["Love"],
      );

  Map<String, dynamic> toJson() => {
        "Career": career,
        "Friendship": friendship,
        "Love": love,
      };
}

class StarRating {
  StarRating({
    this.hustle,
    this.sex,
    this.success,
    this.vibe,
  });

  Hustle hustle;
  Hustle sex;
  Hustle success;
  Hustle vibe;

  factory StarRating.fromJson(Map<String, dynamic> json) => StarRating(
        hustle: Hustle.fromJson(json["Hustle"]),
        sex: Hustle.fromJson(json["Sex"]),
        success: Hustle.fromJson(json["Success"]),
        vibe: Hustle.fromJson(json["Vibe"]),
      );

  Map<String, dynamic> toJson() => {
        "Hustle": hustle.toJson(),
        "Sex": sex.toJson(),
        "Success": success.toJson(),
        "Vibe": vibe.toJson(),
      };
}

class Hustle {
  Hustle({
    this.message,
    this.rating,
  });

  String message;
  int rating;

  factory Hustle.fromJson(Map<String, dynamic> json) => Hustle(
        message: json["message"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "rating": rating,
      };
}
