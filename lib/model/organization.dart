

class Organization{

  String? id;
  String? name;
  String? logo;
  String? description;


  Organization({
    this.id,
    this.name,
    this.logo,
    this.description,
    status,
    message,
    responseCode
  });

  factory Organization.fromJson(Map<String,dynamic> json){
    return Organization(
      id: json['id'],
      name: json['name'],
      logo: json['logo'],
      description: json['description'],
    );
  }

}
