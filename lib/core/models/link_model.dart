class LinkModel {
  final int? id;
  final String title;
  final String url;
  final int userId;
  final String? description;
  final String? icon;
  final int? order;
  final DateTime? startTime;
  final DateTime? endTime;
  final int clickCount;
  bool isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  LinkModel({
    this.id,
    required this.title,
    required this.url,
    required this.userId,
    required this.isActive,
    required this.clickCount,
    this.description,
    this.icon,
    this.order,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
  });

  factory LinkModel.fromJson(Map<String, dynamic> json) {
    return LinkModel(
      id: json['id'],
      title: json['title'],
      url: json['url'],
      userId: json['user_id'],
      isActive: json['is_active'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      clickCount: json['click_count'],
      description: json['description'],
      endTime:
          json['end_time'] == null ? null : DateTime.parse(json['end_time']),
      startTime: json['start_time'] == null
          ? null
          : DateTime.parse(json['start_time']),
      icon: json['icon'],
      order: json['order'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "url": url,
      "user_id": userId,
      "is_active": isActive,
      "created_at":
          createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      "updated_at":
          updatedAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      "click_count": clickCount,
      "description": description,
      "start_time": startTime?.toIso8601String(),
      "end_time": endTime?.toIso8601String(),
      "icon": icon,
      "order": order,
    };
  }
}
