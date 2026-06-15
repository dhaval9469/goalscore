import 'package:goalscore/module/match_details/model/n_match_details_model.dart';


String getMatchStatusText({Status? status}) {
  if (status == null) return "";

  final bool finished = status.finished == true;
  final bool started = status.started == true;
  final bool cancelled = status.cancelled == true;
  final bool awarded = status.awarded == true;

  final String shortReason = status.reason?.short?.toUpperCase() ?? "";
  final String longReason = status.reason?.long ?? "";

  if (cancelled) {
    return "Cancelled";
  }

  if (awarded) {
    return "Awarded";
  }

  if (finished || shortReason == "FT") {
    return "Full Time";
  }

  if (shortReason == "HT") {
    return "Half Time";
  }

  if (shortReason == "ET") {
    return "Extra Time";
  }

  if (shortReason == "PEN") {
    return "Penalties";
  }

  if (shortReason == "AET") {
    return "After Extra Time";
  }

  if (!started) {
    return "Not Started";
  }

  if (longReason.isNotEmpty) {
    return longReason.replaceAll("-", " ");
  }

  return "Live";
}
