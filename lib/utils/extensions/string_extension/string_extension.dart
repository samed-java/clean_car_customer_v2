extension StringExtension on String{
  bool get isImage {
    final imageExtensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp'];
    final extension = split('.').last.toLowerCase();
    return imageExtensions.contains(extension);
  }

  bool get isVideo {
    final videoExtensions = ['mp4', 'mov', 'wmv', 'avi', 'mkv', 'flv', 'webm'];
    final extension = split('.').last.toLowerCase();
    return videoExtensions.contains(extension);
  }
}