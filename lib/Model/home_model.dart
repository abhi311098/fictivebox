// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  HomeModel({
    this.type,
    this.metadata,
    this.features,
    this.bbox,
  });

  String? type;
  Metadata? metadata;
  List<Feature>? features;
  List<double>? bbox;

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
    type: json["type"] == null ? null : json["type"],
    metadata: json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]),
    features: json["features"] == null ? null : List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    bbox: json["bbox"] == null ? null : List<double>.from(json["bbox"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : type,
    "metadata": metadata == null ? null : metadata?.toJson(),
    "features": features == null ? null : List<dynamic>.from(features!.map((x) => x.toJson())),
    "bbox": bbox == null ? null : List<dynamic>.from(bbox!.map((x) => x)),
  };
}

class Feature {
  Feature({
    this.type,
    this.properties,
    this.geometry,
    this.id,
  });

  FeatureType? type;
  Properties? properties;
  Geometry? geometry;
  String? id;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: json["type"] == null ? null : featureTypeValues.map?[json["type"]],
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    id: json["id"] == null ? null : json["id"],
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : featureTypeValues.reverse[type],
    "properties": properties == null ? null : properties?.toJson(),
    "geometry": geometry == null ? null : geometry?.toJson(),
    "id": id == null ? null : id,
  };
}

class Geometry {
  Geometry({
    this.type,
    this.coordinates,
  });

  GeometryType? type;
  List<double>? coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: json["type"] == null ? null : geometryTypeValues.map?[json["type"]],
    coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : geometryTypeValues.reverse[type],
    "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({
  "Point": GeometryType.POINT
});

class Properties {
  Properties({
    this.mag,
    this.place,
    this.time,
    this.updated,
    this.tz,
    this.url,
    this.detail,
    this.felt,
    this.cdi,
    this.mmi,
    this.alert,
    this.status,
    this.tsunami,
    this.sig,
    this.net,
    this.code,
    this.ids,
    this.sources,
    this.types,
    this.nst,
    this.dmin,
    this.rms,
    this.gap,
    this.magType,
    this.type,
    this.title,
  });

  double? mag;
  String? place;
  int? time;
  int? updated;
  dynamic? tz;
  String? url;
  String? detail;
  int? felt;
  double? cdi;
  double? mmi;
  String? alert;
  Status? status;
  int? tsunami;
  int? sig;
  Net? net;
  String? code;
  String? ids;
  String? sources;
  String? types;
  int? nst;
  double? dmin;
  double? rms;
  double? gap;
  MagType? magType;
  PropertiesType? type;
  String? title;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    mag: json["mag"] == null ? null : json["mag"].toDouble(),
    place: json["place"] == null ? null : json["place"],
    time: json["time"] == null ? null : json["time"],
    updated: json["updated"] == null ? null : json["updated"],
    tz: json["tz"],
    url: json["url"] == null ? null : json["url"],
    detail: json["detail"] == null ? null : json["detail"],
    felt: json["felt"] == null ? null : json["felt"],
    cdi: json["cdi"] == null ? null : json["cdi"].toDouble(),
    mmi: json["mmi"] == null ? null : json["mmi"].toDouble(),
    alert: json["alert"] == null ? null : json["alert"],
    status: json["status"] == null ? null : statusValues.map?[json["status"]],
    tsunami: json["tsunami"] == null ? null : json["tsunami"],
    sig: json["sig"] == null ? null : json["sig"],
    net: json["net"] == null ? null : netValues.map?[json["net"]],
    code: json["code"] == null ? null : json["code"],
    ids: json["ids"] == null ? null : json["ids"],
    sources: json["sources"] == null ? null : json["sources"],
    types: json["types"] == null ? null : json["types"],
    nst: json["nst"] == null ? null : json["nst"],
    dmin: json["dmin"] == null ? null : json["dmin"].toDouble(),
    rms: json["rms"] == null ? null : json["rms"].toDouble(),
    gap: json["gap"] == null ? null : json["gap"].toDouble(),
    magType: json["magType"] == null ? null : magTypeValues.map?[json["magType"]],
    type: json["type"] == null ? null : propertiesTypeValues.map?[json["type"]],
    title: json["title"] == null ? null : json["title"],
  );

  Map<String, dynamic> toJson() => {
    "mag": mag == null ? null : mag,
    "place": place == null ? null : place,
    "time": time == null ? null : time,
    "updated": updated == null ? null : updated,
    "tz": tz,
    "url": url == null ? null : url,
    "detail": detail == null ? null : detail,
    "felt": felt == null ? null : felt,
    "cdi": cdi == null ? null : cdi,
    "mmi": mmi == null ? null : mmi,
    "alert": alert == null ? null : alert,
    "status": status == null ? null : statusValues.reverse[status],
    "tsunami": tsunami == null ? null : tsunami,
    "sig": sig == null ? null : sig,
    "net": net == null ? null : netValues.reverse[net],
    "code": code == null ? null : code,
    "ids": ids == null ? null : ids,
    "sources": sources == null ? null : sources,
    "types": types == null ? null : types,
    "nst": nst == null ? null : nst,
    "dmin": dmin == null ? null : dmin,
    "rms": rms == null ? null : rms,
    "gap": gap == null ? null : gap,
    "magType": magType == null ? null : magTypeValues.reverse[magType],
    "type": type == null ? null : propertiesTypeValues.reverse[type],
    "title": title == null ? null : title,
  };
}

enum MagType { ML, MD, MB, MWW, MB_LG, MWR }

final magTypeValues = EnumValues({
  "mb": MagType.MB,
  "mb_lg": MagType.MB_LG,
  "md": MagType.MD,
  "ml": MagType.ML,
  "mwr": MagType.MWR,
  "mww": MagType.MWW
});

enum Net { AK, NC, PR, US, CI, MB, UW, HV, NN, UU, OK, NM, AV, SE }

final netValues = EnumValues({
  "ak": Net.AK,
  "av": Net.AV,
  "ci": Net.CI,
  "hv": Net.HV,
  "mb": Net.MB,
  "nc": Net.NC,
  "nm": Net.NM,
  "nn": Net.NN,
  "ok": Net.OK,
  "pr": Net.PR,
  "se": Net.SE,
  "us": Net.US,
  "uu": Net.UU,
  "uw": Net.UW
});

enum Status { REVIEWED, AUTOMATIC }

final statusValues = EnumValues({
  "automatic": Status.AUTOMATIC,
  "reviewed": Status.REVIEWED
});

enum PropertiesType { EARTHQUAKE, ICE_QUAKE }

final propertiesTypeValues = EnumValues({
  "earthquake": PropertiesType.EARTHQUAKE,
  "ice quake": PropertiesType.ICE_QUAKE
});

enum FeatureType { FEATURE }

final featureTypeValues = EnumValues({
  "Feature": FeatureType.FEATURE
});

class Metadata {
  Metadata({
    this.generated,
    this.url,
    this.title,
    this.status,
    this.api,
    this.count,
  });

  int? generated;
  String? url;
  String? title;
  int? status;
  String? api;
  int? count;

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    generated: json["generated"] == null ? null : json["generated"],
    url: json["url"] == null ? null : json["url"],
    title: json["title"] == null ? null : json["title"],
    status: json["status"] == null ? null : json["status"],
    api: json["api"] == null ? null : json["api"],
    count: json["count"] == null ? null : json["count"],
  );

  Map<String, dynamic> toJson() => {
    "generated": generated == null ? null : generated,
    "url": url == null ? null : url,
    "title": title == null ? null : title,
    "status": status == null ? null : status,
    "api": api == null ? null : api,
    "count": count == null ? null : count,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map?.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
