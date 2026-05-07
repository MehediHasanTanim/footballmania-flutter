import '../../../../core/domain/enums/match_status.dart';

class FixtureFilter {
  const FixtureFilter({
    this.selectedDate,
    this.selectedTeamId,
    this.selectedGroup,
    this.selectedStage,
    this.selectedStatus,
    this.searchQuery,
  });

  final DateTime? selectedDate;
  final int? selectedTeamId;
  final String? selectedGroup;
  final String? selectedStage;
  final MatchStatus? selectedStatus;
  final String? searchQuery;

  bool get hasSearch => (searchQuery ?? '').trim().isNotEmpty;

  bool get hasFilters =>
      selectedDate != null ||
      selectedTeamId != null ||
      _hasText(selectedGroup) ||
      _hasText(selectedStage) ||
      selectedStatus != null;

  bool get isEmpty => !hasSearch && !hasFilters;

  FixtureFilter copyWith({
    DateTime? selectedDate,
    int? selectedTeamId,
    String? selectedGroup,
    String? selectedStage,
    MatchStatus? selectedStatus,
    String? searchQuery,
    bool clearDate = false,
    bool clearTeam = false,
    bool clearGroup = false,
    bool clearStage = false,
    bool clearStatus = false,
    bool clearSearch = false,
  }) {
    return FixtureFilter(
      selectedDate: clearDate ? null : selectedDate ?? this.selectedDate,
      selectedTeamId: clearTeam ? null : selectedTeamId ?? this.selectedTeamId,
      selectedGroup: clearGroup ? null : selectedGroup ?? this.selectedGroup,
      selectedStage: clearStage ? null : selectedStage ?? this.selectedStage,
      selectedStatus: clearStatus
          ? null
          : selectedStatus ?? this.selectedStatus,
      searchQuery: clearSearch ? null : searchQuery ?? this.searchQuery,
    );
  }

  static bool _hasText(String? value) => value?.trim().isNotEmpty == true;
}
