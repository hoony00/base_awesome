
import '../../common/data/index/index.dart';

class ImagesLoadingThumbnail extends StatelessWidget {
  const ImagesLoadingThumbnail({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.fit = BoxFit.fitHeight,
  });

  final String imagePath;
  final double height;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    

    return Center(
      child: Container(
        width: width,
        child: Image.network(
          imagePath,
          height: height,
          width: width,
          filterQuality: FilterQuality.high,
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {

            if (wasSynchronouslyLoaded) {
              return child;
            } else {
              return AnimatedOpacity(
                opacity: frame == null ? 0 : 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeOut,
                child: child,
              );
            }
          },
          fit: fit,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/png/app/logo.png');
          },
        ),
      ),
    );
  }
}
