class PokemonListItem {
  PokemonListItem({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  PokemonListItem.fromJson(dynamic json) {
    _name = json['name'];
    _url = json['url'];
  }
  String? _name;
  String? _url;

  String? get name => _name;
  String? get url => _url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['url'] = _url;
    return map;
  }

}