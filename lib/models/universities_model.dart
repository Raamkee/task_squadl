class UniversitiesModel {
  List<String>? domains;
  List<String>? webPages;
  String? stateProvince;
  String? name;
  String? country;
  String? alphaTwoCode;

  UniversitiesModel(
      {this.domains,
      this.webPages,
      this.stateProvince,
      this.name,
      this.country,
      this.alphaTwoCode});

  UniversitiesModel.fromJson(Map<String, dynamic> json) {
    domains = json['domains'].cast<String>() ?? [];
    webPages = json['web_pages'].cast<String>() ?? [];
    stateProvince = json['state-province'] ?? 'NA';
    name = json['name'] ?? 'NA';
    country = json['country'] ?? 'NA';
    alphaTwoCode = json['alpha_two_code'] ?? 'NA';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['domains'] = domains;
    data['web_pages'] = webPages;
    data['state-province'] = stateProvince;
    data['name'] = name;
    data['country'] = country;
    data['alpha_two_code'] = alphaTwoCode;
    return data;
  }
}
