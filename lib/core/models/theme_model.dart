class ThemeModel {
  final int? id;
  final String? name;
  final int? isPremium;
  final String? backgroundType;
  final String? backgroundValue;
  final String? textColor;
  final String? buttonStyle;
  final String? buttonColor;
  final String? buttonTextColor;
  final String? fontFamily;
  final String? buttonFontFamily;
  final String? linkColor;
  final String? socialIconStyle;
  final String? socialIconColor;
  final int? isCustom;
  final int? userId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ThemeModel({
    this.id,
    this.name,
    this.isPremium,
    this.backgroundType,
    this.backgroundValue,
    this.textColor,
    this.buttonStyle,
    this.buttonColor,
    this.buttonTextColor,
    this.fontFamily,
    this.buttonFontFamily,
    this.linkColor,
    this.socialIconStyle,
    this.socialIconColor,
    this.isCustom,
    this.userId,
    this.createdAt,
    this.updatedAt,
  });

  factory ThemeModel.fromJson(Map<String, dynamic> json) {
    return ThemeModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      isPremium: json['is_premium'] as int?,
      backgroundType: json['background_type'] as String?,
      backgroundValue: json['background_value'] as String?,
      textColor: json['text_color'] as String?,
      buttonStyle: json['button_style'] as String?,
      buttonColor: json['button_color'] as String?,
      buttonTextColor: json['button_text_color'] as String?,
      fontFamily: json['font_family'] as String?,
      buttonFontFamily: json['button_font_family'] as String?,
      linkColor: json['link_color'] as String?,
      socialIconStyle: json['social_icon_style'] as String?,
      socialIconColor: json['social_icon_color'] as String?,
      isCustom: json['is_custom'] as int?,
      userId: json['user_id'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'is_premium': isPremium,
      'background_type': backgroundType,
      'background_value': backgroundValue,
      'text_color': textColor,
      'button_style': buttonStyle,
      'button_color': buttonColor,
      'button_text_color': buttonTextColor,
      'font_family': fontFamily,
      'button_font_family': buttonFontFamily,
      'link_color': linkColor,
      'social_icon_style': socialIconStyle,
      'social_icon_color': socialIconColor,
      'is_custom': isCustom,
      'user_id': userId,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }
}
