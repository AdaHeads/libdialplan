part of Dialplan;

class Extension implements JsonSerializable {
  String comment;
  String name;
  String failoverExtension;
  List<Condition> conditions = new List<Condition>();
  List<Action> actions = new List<Action>();

  Extension({String this.name});

  factory Extension.fromJson(Map json) {
    Extension object = new Extension()
      ..name = json['name']
      ..comment = json['comment']
      ..failoverExtension = json['failoverextension']
      ..conditions.addAll((json['conditions'] as List).map((Map c) => new Condition.fromJson(c)))
      ..actions.addAll((json['actions'] as List).map((Map c) => new Action.fromJson(c)));

    return object;
  }

  Map toJson() {
    Map result = {
      'name': name,
      'conditions': conditions,
      'actions': actions
    };

    if (comment != null) {
      result['comment'] = comment;
    }

    if (failoverExtension != null) {
      result['failoverextension'] = failoverExtension;
    }

    return result;
  }
}
