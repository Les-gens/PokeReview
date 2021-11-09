class Pokemon {
  Pokemon({
      List<Abilities>? abilities, 
      int? height, 
      int? id, 
      bool? isDefault, 
      String? name, 
      int? order, 
      Sprites? sprites, 
      List<Stats>? stats, 
      List<Types>? types, 
      int? weight,}){
    _abilities = abilities;
    _height = height;
    _id = id;
    _isDefault = isDefault;
    _name = name;
    _order = order;
    _sprites = sprites;
    _stats = stats;
    _types = types;
    _weight = weight;
}

  Pokemon.fromJson(dynamic json) {
    if (json['abilities'] != null) {
      _abilities = [];
      json['abilities'].forEach((v) {
        _abilities?.add(Abilities.fromJson(v));
      });
    }
    _height = json['height'];
    _id = json['id'];
    _isDefault = json['is_default'];
    _name = json['name'];
    _order = json['order'];
    _sprites = json['sprites'] != null ? Sprites.fromJson(json['sprites']) : null;
    if (json['stats'] != null) {
      _stats = [];
      json['stats'].forEach((v) {
        _stats?.add(Stats.fromJson(v));
      });
    }
    if (json['types'] != null) {
      _types = [];
      json['types'].forEach((v) {
        _types?.add(Types.fromJson(v));
      });
    }
    _weight = json['weight'];
  }
  List<Abilities>? _abilities;
  int? _height;
  int? _id;
  bool? _isDefault;
  String? _name;
  int? _order;
  Sprites? _sprites;
  List<Stats>? _stats;
  List<Types>? _types;
  int? _weight;

  List<Abilities>? get abilities => _abilities;
  int? get height => _height;
  int? get id => _id;
  bool? get isDefault => _isDefault;
  String? get name => _name;
  int? get order => _order;
  Sprites? get sprites => _sprites;
  List<Stats>? get stats => _stats;
  List<Types>? get types => _types;
  int? get weight => _weight;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_abilities != null) {
      map['abilities'] = _abilities?.map((v) => v.toJson()).toList();
    }
    map['height'] = _height;
    map['id'] = _id;
    map['is_default'] = _isDefault;
    map['name'] = _name;
    map['order'] = _order;
    if (_sprites != null) {
      map['sprites'] = _sprites?.toJson();
    }
    if (_stats != null) {
      map['stats'] = _stats?.map((v) => v.toJson()).toList();
    }
    if (_types != null) {
      map['types'] = _types?.map((v) => v.toJson()).toList();
    }
    map['weight'] = _weight;
    return map;
  }

}

class Types {
  Types({
      int? slot, 
      Type? type,}){
    _slot = slot;
    _type = type;
}

  Types.fromJson(dynamic json) {
    _slot = json['slot'];
    _type = json['type'] != null ? Type.fromJson(json['type']) : null;
  }
  int? _slot;
  Type? _type;

  int? get slot => _slot;
  Type? get type => _type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slot'] = _slot;
    if (_type != null) {
      map['type'] = _type?.toJson();
    }
    return map;
  }

}

class Type {
  Type({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Type.fromJson(dynamic json) {
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

class Stats {
  Stats({
      int? baseStat, 
      int? effort, 
      Stat? stat,}){
    _baseStat = baseStat;
    _effort = effort;
    _stat = stat;
}

  Stats.fromJson(dynamic json) {
    _baseStat = json['base_stat'];
    _effort = json['effort'];
    _stat = json['stat'] != null ? Stat.fromJson(json['stat']) : null;
  }
  int? _baseStat;
  int? _effort;
  Stat? _stat;

  int? get baseStat => _baseStat;
  int? get effort => _effort;
  Stat? get stat => _stat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['base_stat'] = _baseStat;
    map['effort'] = _effort;
    if (_stat != null) {
      map['stat'] = _stat?.toJson();
    }
    return map;
  }

}

class Stat {
  Stat({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Stat.fromJson(dynamic json) {
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

class Sprites {
  Sprites({
      String? backDefault,}){
    _backDefault = backDefault;
}

  Sprites.fromJson(dynamic json) {
    _backDefault = json['back_default'];
  }
  String? _backDefault;

  String? get backDefault => _backDefault;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['back_default'] = _backDefault;
    return map;
  }

}

class Abilities {
  Abilities({
      Ability? ability, 
      bool? isHidden, 
      int? slot,}){
    _ability = ability;
    _isHidden = isHidden;
    _slot = slot;
}

  Abilities.fromJson(dynamic json) {
    _ability = json['ability'] != null ? Ability.fromJson(json['ability']) : null;
    _isHidden = json['is_hidden'];
    _slot = json['slot'];
  }
  Ability? _ability;
  bool? _isHidden;
  int? _slot;

  Ability? get ability => _ability;
  bool? get isHidden => _isHidden;
  int? get slot => _slot;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_ability != null) {
      map['ability'] = _ability?.toJson();
    }
    map['is_hidden'] = _isHidden;
    map['slot'] = _slot;
    return map;
  }

}

class Ability {
  Ability({
      String? name, 
      String? url,}){
    _name = name;
    _url = url;
}

  Ability.fromJson(dynamic json) {
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