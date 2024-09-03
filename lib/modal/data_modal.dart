import 'dart:convert';

DataModal dataModalFromJson(String str) => DataModal.fromJson(json.decode(str));

String dataModalToJson(DataModal data) => json.encode(data.toJson());

class DataModal {
    String version;
    String encoding;
    Dashboard dashboard;

    DataModal({
        required this.version,
        required this.encoding,
        required this.dashboard,
    });

    factory DataModal.fromJson(Map<String, dynamic> json) => DataModal(
        version: json["version"],
        encoding: json["encoding"],
        dashboard: Dashboard.fromJson(json["dashboard"]),
    );

    Map<String, dynamic> toJson() => {
        "version": version,
        "encoding": encoding,
        "dashboard": dashboard.toJson(),
    };
}

class Dashboard {
    List<Category> categories;
    List<Banner> banners;
    List<TrendingNew> trendingNews;
    List<Banner> breakingNews;

    Dashboard({
        required this.categories,
        required this.banners,
        required this.trendingNews,
        required this.breakingNews,
    });

    factory Dashboard.fromJson(Map<String, dynamic> json) => Dashboard(
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        trendingNews: List<TrendingNew>.from(json["trending_news"].map((x) => TrendingNew.fromJson(x))),
        breakingNews: List<Banner>.from(json["breaking_news"].map((x) => Banner.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "trending_news": List<dynamic>.from(trendingNews.map((x) => x.toJson())),
        "breaking_news": List<dynamic>.from(breakingNews.map((x) => x.toJson())),
    };
}

class Banner {
    String id;
    String title;
    String coverImage;
    String related;
    DateTime published;
    String newsViews;
    String category;
    String summary;

    Banner({
        required this.id,
        required this.title,
        required this.coverImage,
        required this.related,
        required this.published,
        required this.newsViews,
        required this.category,
        required this.summary,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        title: json["title"],
        coverImage: json["coverImage"],
        related: json["related"],
        published: DateTime.parse(json["published"]),
        newsViews: json["newsViews"],
        category: json["category"],
        summary: json["summary"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "coverImage": coverImage,
        "related": related,
        "published": "${published.year.toString().padLeft(4, '0')}-${published.month.toString().padLeft(2, '0')}-${published.day.toString().padLeft(2, '0')}",
        "newsViews": newsViews,
        "category": category,
        "summary": summary,
    };
}

class Category {
    String catId;
    String title;
    String image;
    String count;

    Category({
        required this.catId,
        required this.title,
        required this.image,
        required this.count,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        catId: json["catId"],
        title: json["title"],
        image: json["image"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "catId": catId,
        "title": title,
        "image": image,
        "count": count,
    };
}

class TrendingNew {
    String id;
    String title;
    String coverImage;
    String related;
    DateTime published;
    String newsViews;
    String category;
    String summary;

    TrendingNew({
        required this.id,
        required this.title,
        required this.coverImage,
        required this.related,
        required this.published,
        required this.newsViews,
        required this.category,
        required this.summary,
    });

    factory TrendingNew.fromJson(Map<String, dynamic> json) => TrendingNew(
        id: json["id"],
        title: json["title"],
        coverImage: json["coverImage"],
        related: json["related"],
        published: DateTime.parse(json["published"]),
        newsViews: json["newsViews"],
        category: json["category"],
        summary: json["summary"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "coverImage": coverImage,
        "related": related,
        "published": "${published.year.toString().padLeft(4, '0')}-${published.month.toString().padLeft(2, '0')}-${published.day.toString().padLeft(2, '0')}",
        "newsViews": newsViews,
        "category": category,
        "summary": summary,
    };
}
class BreakingNew {
    String id;
    String title;
    String coverImage;
    String related;
    DateTime published;
    String newsViews;
    String category;
    String summary;

    BreakingNew({
        required this.id,
        required this.title,
        required this.coverImage,
        required this.related,
        required this.published,
        required this.newsViews,
        required this.category,
        required this.summary,
    });

    factory BreakingNew.fromJson(Map<String, dynamic> json) => BreakingNew(
        id: json["id"],
        title: json["title"],
        coverImage: json["coverImage"],
        related: json["related"],
        published: DateTime.parse(json["published"]),
        newsViews: json["newsViews"],
        category: json["category"],
        summary: json["summary"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "coverImage": coverImage,
        "related": related,
        "published": "${published.year.toString().padLeft(4, '0')}-${published.month.toString().padLeft(2, '0')}-${published.day.toString().padLeft(2, '0')}",
        "newsViews": newsViews,
        "category": category,
        "summary": summary,
    };
}