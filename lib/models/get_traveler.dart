// ignore_for_file: prefer_collection_literals

class TravelPageResponse {
  TravelerinformationResponse? travelerinformationResponse;

  TravelPageResponse({this.travelerinformationResponse});

  TravelPageResponse.fromJson(Map<String, dynamic> json) {
    travelerinformationResponse = json['TravelerinformationResponse'] != null
        ? TravelerinformationResponse.fromJson(
            json['TravelerinformationResponse'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (travelerinformationResponse != null) {
      data['TravelerinformationResponse'] =
          travelerinformationResponse!.toJson();
    }
    return data;
  }
}

class TravelerinformationResponse {
  String? page;
  String? perPage;
  String? totalPages;
  String? totalrecord;
  Travelers? travelers;

  TravelerinformationResponse(
      {this.page,
      this.perPage,
      this.totalPages,
      this.totalrecord,
      this.travelers});

  TravelerinformationResponse.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    perPage = json['per_page'];
    totalPages = json['total_pages'];
    totalrecord = json['totalrecord'];
    travelers = json['travelers'] != null
        ? Travelers.fromJson(json['travelers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['page'] = page;
    data['per_page'] = perPage;
    data['total_pages'] = totalPages;
    data['totalrecord'] = totalrecord;
    if (travelers != null) {
      data['travelers'] = travelers!.toJson();
    }
    return data;
  }
}

class Travelers {
  List<Travelerinformation>? travelerinformation;

  Travelers({this.travelerinformation});

  Travelers.fromJson(Map<String, dynamic> json) {
    if (json['Travelerinformation'] != null) {
      travelerinformation = <Travelerinformation>[];
      json['Travelerinformation'].forEach((v) {
        travelerinformation!.add(Travelerinformation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (travelerinformation != null) {
      data['Travelerinformation'] =
          travelerinformation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Travelerinformation {
  String? adderes;
  String? createdat;
  String? email;
  String? id;
  String? name;

  Travelerinformation(
      {this.adderes, this.createdat, this.email, this.id, this.name});

  Travelerinformation.fromJson(Map<String, dynamic> json) {
    adderes = json['adderes'];
    createdat = json['createdat'];
    email = json['email'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['adderes'] = adderes;
    data['createdat'] = createdat;
    data['email'] = email;
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class TravelPostResponse {
  TravelerinformationPost? travelerinformation;

  TravelPostResponse({this.travelerinformation});

  TravelPostResponse.fromJson(Map<String, dynamic> json) {
    travelerinformation = json['Travelerinformation'] != null
        ? TravelerinformationPost.fromJson(json['Travelerinformation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (travelerinformation != null) {
      data['Travelerinformation'] = travelerinformation!.toJson();
    }
    return data;
  }
}

class TravelerinformationPost {
  String? id;
  String? name;
  String? email;
  String? adderes;
  String? createdat;

  TravelerinformationPost(
      {this.id, this.name, this.email, this.adderes, this.createdat});

  TravelerinformationPost.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    adderes = json['adderes'];
    createdat = json['createdat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['adderes'] = adderes;
    data['createdat'] = createdat;
    return data;
  }
}
