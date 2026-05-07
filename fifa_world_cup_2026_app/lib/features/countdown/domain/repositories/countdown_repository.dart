import '../../../../core/utils/result.dart';
import '../entities/countdown.dart';

abstract class CountdownRepository {
  Future<Result<Countdown>> getTournamentCountdown({DateTime? nowUtc});

  Future<Result<Countdown>> getMatchCountdown(DateTime kickoffUtc, {DateTime? nowUtc});
}
