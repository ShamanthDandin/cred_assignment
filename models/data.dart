class CardDetails {
  final String header;
  final String description;
  final int maxRange;
  final int minRange;

  CardDetails({
    required this.header,
    required this.description,
    required this.maxRange,
    required this.minRange,
  });

  factory CardDetails.fromJson(Map<String, dynamic> json) {
    return CardDetails(
      header: json['header'],
      description: json['description'],
      maxRange: json['max_range'],
      minRange: json['min_range'],
    );
  }
}

class OpenState {
  final String title;
  final String subtitle;
  final CardDetails? card;
  final List<Item>? items;
  final String footer;

  OpenState({
    required this.title,
    required this.subtitle,
    this.card,
    this.items,
    required this.footer,
  });

  factory OpenState.fromJson(Map<String, dynamic> json) {
    return OpenState(
      title: json['body']['title'],
      subtitle: json['body']['subtitle'],
      card: json['body']['card'] != null
          ? CardDetails.fromJson(json['body']['card'])
          : null,
      items: (json['body']['items'] as List<dynamic>?)
          ?.map((item) => Item.fromJson(item))
          .toList(),
      footer: json['body']['footer'],
    );
  }
}

class ClosedState {
  final Map<String, String> body;

  ClosedState({required this.body});

  factory ClosedState.fromJson(Map<String, dynamic> json) {
    return ClosedState(
      body: Map<String, String>.from(json['body']),
    );
  }
}

class Item {
  final String? emi;
  final String? duration;
  final String title;
  final String subtitle;
  final String? tag;

  Item({
    this.emi,
    this.duration,
    required this.title,
    required this.subtitle,
    this.tag,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      emi: json['emi'],
      duration: json['duration'],
      title: json['title'],
      subtitle: json['subtitle'],
      tag: json['tag'],
    );
  }
}

class ItemModel {
  final OpenState openState;
  final ClosedState closedState;
  final String ctaText;

  ItemModel({
    required this.openState,
    required this.closedState,
    required this.ctaText,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      openState: OpenState.fromJson(json['open_state']),
      closedState: ClosedState.fromJson(json['closed_state']),
      ctaText: json['cta_text'],
    );
  }
}

class Model {
  final List<ItemModel> items;

  Model({required this.items});

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
      items: (json['items'] as List<dynamic>)
          .map((item) => ItemModel.fromJson(item))
          .toList(),
    );
  }
}
