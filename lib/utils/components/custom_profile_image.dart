import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  const CustomImage({
    super.key,
    required this.imageUrl,
    this.width = 60.0,
    this.height = 60.0,
  });

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      return _buildErrorImage();
    }

    return FutureBuilder(
      future: _fetchImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingIndicator();
        } else if (snapshot.hasError) {
          return _buildErrorImage();
        } else if (snapshot.hasData) {
          return Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: BoxFit.cover,
          );
        } else {
          return _buildErrorImage();
        }
      },
    );
  }

  Future<ImageProvider> _fetchImage() async {
    try {
      final response = await NetworkAssetBundle(Uri.parse(imageUrl)).load('');
      return MemoryImage(Uint8List.fromList(response.buffer.asUint8List()));
    } catch (e) {
      return AssetImage('');
    }
  }

  Widget _buildLoadingIndicator() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorImage() {
    return Image.network(
      'https://ui-avatars.com/api/?name=Not+Available',
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
