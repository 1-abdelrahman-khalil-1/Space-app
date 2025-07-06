class NewsModel {
  final String title;
  final String description;
  final String imageUrl;
  final DateTime date;
  final String url;

  NewsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.date,
    required this.url,
  });

  factory NewsModel.fromMap(Map<String, dynamic> map) {
    return NewsModel(
      title: map['title'] ?? 'Unknown Title',
      description: map['description'] ?? 'No description available',
      imageUrl: map['imageUrl'] ?? map['url'] ?? '', 
      date: map['date'] != null 
          ? DateTime.parse(map['date']) 
          : DateTime.now(),
      url: 'https://isstracker.pl/en/photos/apod/2024-09-11',
    );
  }
}