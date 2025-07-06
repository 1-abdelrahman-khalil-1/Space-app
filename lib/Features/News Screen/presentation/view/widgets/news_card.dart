import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/Core/utils/apptextstyles.dart';
import 'package:space_app/Features/News%20Screen/data/models/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  final bool isFeatured;

  const NewsCard({
    super.key,
    required this.news,
    this.isFeatured = false,
  });

  String _formatDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (news.url.isNotEmpty && await canLaunchUrl(Uri.parse(news.url))) {
         await launchUrl(
            Uri.parse(news.url),
            mode: LaunchMode.inAppWebView,
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No URL available for this news')),
          );
        }
      },
      child: Card(
        color: const Color.fromARGB(79, 33, 177, 243),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        //margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: AspectRatio(
                aspectRatio: isFeatured ? 16 / 9 : 16 / 10,
                child: CachedNetworkImage(
                  imageUrl: news.imageUrl,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    color: Colors.black12,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    child: const Icon(Icons.error_outline, size: 40),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: isFeatured 
                        ? Apptextstyles.bold16.copyWith(color: Colors.white)
                        : Apptextstyles.medium16.copyWith(color: Colors.white),
                  ),
                   SizedBox(height: 4.h),
                  Text(
                    _formatDate(news.date),
                    style: Apptextstyles.regular12.copyWith(color: Colors.grey[400]),
                  ),
                  if (!isFeatured) ...[
                     SizedBox(height: 8.h),
                    Text(
                      news.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: Apptextstyles.regular14.copyWith(color: Colors.white),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}