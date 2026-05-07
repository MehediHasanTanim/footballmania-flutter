import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/domain/enums/favorite_type.dart';
import '../../features/favorites/domain/entities/favorite_item.dart';
import '../../features/teams/domain/entities/team.dart';
import 'favorite_button.dart';

class TeamCard extends StatelessWidget {
  const TeamCard({super.key, required this.team, this.onTap});

  final Team team;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              _Flag(url: team.flagUrl, fallback: team.countryCode),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      team.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                          ),
                    ),
                    Text(
                      [
                        if (team.group != null) 'Group ${team.group}',
                        if (team.fifaRanking != null) '#${team.fifaRanking}',
                      ].join('  '),
                    ),
                  ],
                ),
              ),
              FavoriteButton(
                favorite: FavoriteItem(
                  id: 'team-${team.id}',
                  type: FavoriteType.team,
                  referenceId: team.id.toString(),
                  title: team.name,
                  subtitle: team.group,
                  imageUrl: team.flagUrl,
                  createdAt: DateTime.now(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Flag extends StatelessWidget {
  const _Flag({required this.url, required this.fallback});

  final String? url;
  final String fallback;

  @override
  Widget build(BuildContext context) {
    final placeholder = CircleAvatar(child: Text(fallback.take(2)));
    if (url == null || url!.isEmpty) return placeholder;
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: url!,
        width: 48,
        height: 48,
        fit: BoxFit.cover,
        placeholder: (context, url) => placeholder,
        errorWidget: (context, url, error) => placeholder,
      ),
    );
  }
}

extension on String {
  String take(int count) => length <= count ? this : substring(0, count);
}
