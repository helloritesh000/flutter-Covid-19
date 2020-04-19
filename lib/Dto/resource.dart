class Resource {
  List<Resources> resources;

  Resource({this.resources});

  Resource.fromJson(Map<String, dynamic> json) {
    if (json['resources'] != null) {
      resources = new List<Resources>();
      json['resources'].forEach((v) {
        resources.add(new Resources.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.resources != null) {
      data['resources'] = this.resources.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Resources {
  String category;
  String city;
  String contact;
  String descriptionandorserviceprovided;
  String nameoftheorganisation;
  String phonenumber;
  String state;

  Resources(
      {this.category,
        this.city,
        this.contact,
        this.descriptionandorserviceprovided,
        this.nameoftheorganisation,
        this.phonenumber,
        this.state});

  Resources.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    city = json['city'];
    contact = json['contact'];
    descriptionandorserviceprovided = json['descriptionandorserviceprovided'];
    nameoftheorganisation = json['nameoftheorganisation'];
    phonenumber = json['phonenumber'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['city'] = this.city;
    data['contact'] = this.contact;
    data['descriptionandorserviceprovided'] =
        this.descriptionandorserviceprovided;
    data['nameoftheorganisation'] = this.nameoftheorganisation;
    data['phonenumber'] = this.phonenumber;
    data['state'] = this.state;
    return data;
  }
}
