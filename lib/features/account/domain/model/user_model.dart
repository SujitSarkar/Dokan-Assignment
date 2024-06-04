import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

class UserModel {
  final int? id;
  final String? username;
  final String? name;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? url;
  final String? description;
  final String? link;
  final String? locale;
  final String? nickname;
  final String? slug;
  final List<String>? roles;
  final DateTime? registeredDate;
  final Capabilities? capabilities;
  final ExtraCapabilities? extraCapabilities;
  final Map<String, String>? avatarUrls;
  final Meta? meta;
  final Links? links;

  UserModel({
    this.id,
    this.username,
    this.name,
    this.firstName,
    this.lastName,
    this.email,
    this.url,
    this.description,
    this.link,
    this.locale,
    this.nickname,
    this.slug,
    this.roles,
    this.registeredDate,
    this.capabilities,
    this.extraCapabilities,
    this.avatarUrls,
    this.meta,
    this.links,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        url: json["url"],
        description: json["description"],
        link: json["link"],
        locale: json["locale"],
        nickname: json["nickname"],
        slug: json["slug"],
        roles: json["roles"] == null
            ? []
            : List<String>.from(json["roles"]!.map((x) => x)),
        registeredDate: json["registered_date"] == null
            ? null
            : DateTime.parse(json["registered_date"]),
        capabilities: json["capabilities"] == null
            ? null
            : Capabilities.fromJson(json["capabilities"]),
        extraCapabilities: json["extra_capabilities"] == null
            ? null
            : ExtraCapabilities.fromJson(json["extra_capabilities"]),
        avatarUrls: Map.from(json["avatar_urls"]!)
            .map((k, v) => MapEntry<String, String>(k, v)),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );
}

class Capabilities {
  final bool? read;
  final bool? level0;
  final bool? subscriber;

  Capabilities({
    this.read,
    this.level0,
    this.subscriber,
  });

  factory Capabilities.fromJson(Map<String, dynamic> json) => Capabilities(
        read: json["read"],
        level0: json["level_0"],
        subscriber: json["subscriber"],
      );
}

class ExtraCapabilities {
  final bool? subscriber;

  ExtraCapabilities({
    this.subscriber,
  });

  factory ExtraCapabilities.fromJson(Map<String, dynamic> json) =>
      ExtraCapabilities(
        subscriber: json["subscriber"],
      );
}

class Links {
  final List<Collection>? self;
  final List<Collection>? collection;

  Links({
    this.self,
    this.collection,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: json["self"] == null
            ? []
            : List<Collection>.from(
                json["self"]!.map((x) => Collection.fromJson(x))),
        collection: json["collection"] == null
            ? []
            : List<Collection>.from(
                json["collection"]!.map((x) => Collection.fromJson(x))),
      );
}

class Collection {
  final String? href;

  Collection({
    this.href,
  });

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        href: json["href"],
      );
}

class Meta {
  final List<dynamic>? persistedPreferences;

  Meta({
    this.persistedPreferences,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        persistedPreferences: json["persisted_preferences"] == null
            ? []
            : List<dynamic>.from(json["persisted_preferences"]!.map((x) => x)),
      );
}
