class ProfileModel {
  final int? id;
  final int? userId;
  final int? themeId;
  final int? customThemeId;
  final String? bio;
  final String? profilePicture;
  final String? customUrl;
  final String? title;
  final String? socialLinks;
  final int? isPrivate;
  final String? seoTitle;
  final String? seoDescription;
  final String? googleAnalyticsId;
  final String? customMeta;
  final int? viewCount;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ProfileModel({
    this.id,
    this.userId,
    this.themeId,
    this.customThemeId,
    this.bio,
    this.profilePicture,
    this.customUrl,
    this.title,
    this.socialLinks,
    this.isPrivate,
    this.seoTitle,
    this.seoDescription,
    this.googleAnalyticsId,
    this.customMeta,
    this.viewCount,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      themeId: json['theme_id'] as int?,
      customThemeId: json['custom_theme_id'] as int?,
      bio: json['bio'] as String?,
      profilePicture: json['profile_picture'] as String?,
      customUrl: json['custom_url'] as String?,
      title: json['title'] as String?,
      socialLinks: json['social_links'] as String?,
      isPrivate: json['is_private'] as int?,
      seoTitle: json['seo_title'] as String?,
      seoDescription: json['seo_description'] as String?,
      googleAnalyticsId: json['google_analytics_id'] as String?,
      customMeta: json['custom_meta'] as String?,
      viewCount: json['view_count'] as int?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user_id": userId,
      "theme_id": themeId,
      "custom_theme_id": customThemeId,
      "bio": bio,
      "profile_picture": profilePicture,
      "custom_url": customUrl,
      "title": title,
      "social_links": socialLinks,
      "is_private": isPrivate,
      "seo_title": seoTitle,
      "seo_description": seoDescription,
      "google_analytics_id": googleAnalyticsId,
      "custom_meta": customMeta,
      "view_count": viewCount,
      "created_at":
          createdAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
      "updated_at":
          updatedAt?.toIso8601String() ?? DateTime.now().toIso8601String(),
    };
  }
}
