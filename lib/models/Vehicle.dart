import 'dart:convert';

Vehicle vehicleFromJson(String str) => Vehicle.fromJson(json.decode(str));

String vehicleToJson(Vehicle data) => json.encode(data.toJson());

class Vehicle {
    int count;
    String next;
    dynamic previous;
    List<Result> results;

    Vehicle({
        this.count,
        this.next,
        this.previous,
        this.results,
    });

    factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
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
    String model;
    String manufacturer;
    String costInCredits;
    String length;
    String maxAtmospheringSpeed;
    String crew;
    String passengers;
    String cargoCapacity;
    String consumables;
    String vehicleClass;
    List<String> pilots;
    List<String> films;
    DateTime created;
    DateTime edited;
    String url;

    Result({
        this.name,
        this.model,
        this.manufacturer,
        this.costInCredits,
        this.length,
        this.maxAtmospheringSpeed,
        this.crew,
        this.passengers,
        this.cargoCapacity,
        this.consumables,
        this.vehicleClass,
        this.pilots,
        this.films,
        this.created,
        this.edited,
        this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        model: json["model"],
        manufacturer: json["manufacturer"],
        costInCredits: json["cost_in_credits"],
        length: json["length"],
        maxAtmospheringSpeed: json["max_atmosphering_speed"],
        crew: json["crew"],
        passengers: json["passengers"],
        cargoCapacity: json["cargo_capacity"],
        consumables: json["consumables"],
        vehicleClass: json["vehicle_class"],
        pilots: List<String>.from(json["pilots"].map((x) => x)),
        films: List<String>.from(json["films"].map((x) => x)),
        created: DateTime.parse(json["created"]),
        edited: DateTime.parse(json["edited"]),
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "model": model,
        "manufacturer": manufacturer,
        "cost_in_credits": costInCredits,
        "length": length,
        "max_atmosphering_speed": maxAtmospheringSpeed,
        "crew": crew,
        "passengers": passengers,
        "cargo_capacity": cargoCapacity,
        "consumables": consumables,
        "vehicle_class": vehicleClass,
        "pilots": List<dynamic>.from(pilots.map((x) => x)),
        "films": List<dynamic>.from(films.map((x) => x)),
        "created": created.toIso8601String(),
        "edited": edited.toIso8601String(),
        "url": url,
    };
}