import 'package:goalscore/module/home/model/matches_model.dart';
import 'package:goalscore/module/match_details/model/m_relevant_matches_m.dart';

String getLiveMinute(Time? time) {
  if (time == null) return '';
  if (time.status?.type != 'inprogress') return '';
  if (time.currentPeriodStartTimestamp == null) return '';

  // Current time in seconds
  final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  // How many seconds passed since period started
  final elapsed = now - time.currentPeriodStartTimestamp!;

  // Convert to minutes
  final elapsedMinutes = (elapsed ~/ 60).clamp(0, 50);

  // Base minute depends on which period
  int baseMinute = 0;
  switch (time.status?.description) {
    case '1st_half':
      baseMinute = 0; // 1' → 45'
    case '2nd_half':
      baseMinute = 45; // 46' → 90'
    case '1st_extra':
      baseMinute = 90; // 91' → 105'
    case '2nd_extra':
      baseMinute = 105; // 106' → 120'
    default:
      baseMinute = 0;
  }

  final minute = (baseMinute + elapsedMinutes).clamp(1, 120);

  // Add injury time if available
  final injury = time.announcedInjuryTime ?? 0;
  if (injury > 0) {
    return "$minute+$injury'"; // e.g. 45+2'
  }

  return "$minute'"; // e.g. 67'
}

String getRMLiveMinute(RMTime? time) {
  if (time == null) return '';
  if (time.status?.type != 'inprogress') return '';
  if (time.currentPeriodStartTimestamp == null) return '';

  // Current time in seconds
  final now = DateTime.now().millisecondsSinceEpoch ~/ 1000;

  // How many seconds passed since period started
  final elapsed = now - time.currentPeriodStartTimestamp!;

  // Convert to minutes
  final elapsedMinutes = (elapsed ~/ 60).clamp(0, 50);

  // Base minute depends on which period
  int baseMinute = 0;
  switch (time.status?.description) {
    case '1st_half':
      baseMinute = 0; // 1' → 45'
    case '2nd_half':
      baseMinute = 45; // 46' → 90'
    case '1st_extra':
      baseMinute = 90; // 91' → 105'
    case '2nd_extra':
      baseMinute = 105; // 106' → 120'
    default:
      baseMinute = 0;
  }

  final minute = (baseMinute + elapsedMinutes).clamp(1, 120);

  // Add injury time if available
  final injury = time.announcedInjuryTime ?? 0;
  if (injury > 0) {
    return "$minute+$injury'"; // e.g. 45+2'
  }

  return "$minute'"; // e.g. 67'
}
