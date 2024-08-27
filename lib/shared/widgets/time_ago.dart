class TimeAgo {
  static String timeAgo(String time) {
    final now = DateTime.now();
    final difference = now.difference(DateTime.parse(time));
    final seconds = difference.inSeconds;
    final minutes = difference.inMinutes;
    final hours = difference.inHours;
    final days = difference.inDays;
    final weeks = difference.inDays / 7;
    final months = difference.inDays / 30;
    final years = difference.inDays / 365;
    if (seconds < 60) {
      return 'អម្បាញ់មិញ';
    } else if (minutes < 60) {
      return '$minutes នាទីមុន';
    } else if (hours < 24) {
      return '$hours ម៉ោងមុន';
    } else if (days < 7) {
      return '$days ថ្ងៃមុន';
    } else if (weeks < 4) {
      return '$weeks សប្ដាហ៍មុន';
    } else if (months < 12) {
      return '$months ខែមុន';
    } else {
      return '$years ឆ្នាំមុន';
    }
  }
}
