import 'package:intl/intl.dart';

class CustomDateUtils {
  static final DateFormat _displayDateFormat =
      DateFormat('MMM dd, yyyy, h:mm a');

  static String formatDate(String isoDateString) {
    DateTime? dateTime = DateTime.tryParse(isoDateString);
    if (dateTime == null) return '';
    return _displayDateFormat.format(dateTime);
  }

  static String timeAgo(String formattedDateString) {
    DateTime? dateTime = _parseFormattedDateString(formattedDateString);
    if (dateTime == null) return 'Invalid date';

    final Duration difference = DateTime.now().difference(dateTime);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}d ago';
    } else {
      return formattedDateString;
    }
  }

  static DateTime? _parseFormattedDateString(String formattedDateString) {
    try {
      return _displayDateFormat.parse(formattedDateString);
    } catch (e) {
      return null;
    }
  }
}
