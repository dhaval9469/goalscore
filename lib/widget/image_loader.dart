import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:goalscore/res/app_assets.dart';
import 'package:goalscore/utils/responsive.dart';

Widget showLeagueLogo({required BuildContext context, required String url}) {
  final String finalUrl = "https://images.fotmob.com/image_resources/logo/leaguelogo/dark/$url.png";

  return url.isEmpty
      ? Image.asset(AppAssets.league, height: context.wp(5), width: context.wp(5), fit: BoxFit.cover)
      : CachedNetworkImage(
          imageUrl: finalUrl,
          height: context.wp(7),
          width: context.wp(7),
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 500),
          fadeOutDuration: const Duration(milliseconds: 300),
          placeholder: (context, finalUrl) => SizedBox(
            height: context.wp(5),
            width: context.wp(5),
            child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: Theme.of(context).colorScheme.secondary)),
          ),
          errorWidget: (context, finalUrl, error) =>
              Image.asset(AppAssets.league, height: context.wp(5), width: context.wp(5), fit: BoxFit.cover),
        );
}

Widget showTeamLogo({required BuildContext context, required String url, bool isFullUrl = false, double w = 5, double h = 5}) {
  final double height = context.wp(h);
  final double width = context.wp(w);

  final String finalUrl = isFullUrl ? url : "https://images.fotmob.com/image_resources/logo/teamlogo/${url}_xsmall.png";
  return url.isEmpty
      ? Image.asset(AppAssets.league, height: height, width: width, fit: BoxFit.cover)
      : CachedNetworkImage(
          imageUrl: finalUrl,
          height: height,
          width: width,
          fit: BoxFit.cover,
          fadeInDuration: const Duration(milliseconds: 500),
          fadeOutDuration: const Duration(milliseconds: 300),
          placeholder: (context, finalUrl) => SizedBox(
            height: height,
            width: width,
            child: Center(child: CircularProgressIndicator(strokeWidth: 2, color: Theme.of(context).colorScheme.secondary)),
          ),
          errorWidget: (context, finalUrl, error) =>
              Image.asset(AppAssets.league, height: height, width: width, fit: BoxFit.cover),
        );
}

Widget showPlayerImage({required BuildContext context, required String? url, double w = 9.5, double h = 9.5}) {
  final double height = context.wp(h);
  final double width = context.wp(w);

  final String imageUrl = "https://images.fotmob.com/image_resources/playerimages/$url.png";

  Widget defaultImage() {
    return Image.asset(AppAssets.dPlayer, height: height, width: width, fit: BoxFit.cover);
  }

  final bool isValidUrl = imageUrl.isNotEmpty && (imageUrl.startsWith("http://") || imageUrl.startsWith("https://"));

  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
    child: ClipOval(
      child: !isValidUrl
          ? defaultImage()
          : CachedNetworkImage(
              imageUrl: imageUrl,
              height: height,
              width: width,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 500),
              fadeOutDuration: const Duration(milliseconds: 300),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator(strokeWidth: 2, color: Theme.of(context).colorScheme.secondary)),
              errorWidget: (context, url, error) => defaultImage(),
            ),
    ),
  );
}
