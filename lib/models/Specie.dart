import 'dart:convert';

Specie specieFromJson(String str) => Specie.fromJson(json.decode(str));

String specieToJson(Specie data) => json.encode(data.toJson());

class Specie {
    int count;
    String next;
    dynamic previous;
    List<Result> results;

    Specie({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory Specie.fromJson(Map<String, dynamic> json) => Specie(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    String name;
    String classification;
    Designation designation;
    String averageHeight;
    String skinColors;
    String hairColors;
    String eyeColors;
    String averageLifespan;
    String homeworld;
    String language;
    List<String> people;
    List<String> films;
    DateTime created;
    DateTime edited;
    String url;

    Result({
        this.name,
        this.classification,
        this.designation,
        this.averageHeight,
        this.skinColors,
        this.hairColors,
        this.eyeColors,
        this.averageLifespan,
        this.homeworld,
        this.language,
        this.people,
        this.films,
        this.created,
        this.edited,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        classification: json["classification"],
        designation: designationValues.map[json["designation"]],
        averageHeight: json["average_height"],
        skinColors: json["skin_colors"],
        hairColors: json["hair_colors"],
        eyeColors: json["eye_colors"],
        averageLifespan: json["average_lifespan"],
        homeworld: json["homeworld"],
        language: json["language"],
        people: List<String>.from(json["people"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "classification": classification,
        "designation": designationValues.reverse[designation],
        "average_height": averageHeight,
        "skin_colors": skinColors,
        "hair_colors": hairColors,
        "eye_colors": eyeColors,
        "average_lifespan": averageLifespan,
        "homeworld": homeworld,
        "language": language,
        "people": List<dynamic>.from(people.map((x) => x)),
        "films": List<dynamic>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
    };
}

enum Designation { SENTIENT }

final designationValues = EnumValues({
    "sentient": Designation.SENTIENT
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}