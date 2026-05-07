import '../../../../core/constants/tournament_constants.dart';
import '../../../../core/utils/result.dart';
import '../../domain/entities/countdown.dart';
import '../../domain/repositories/countdown_repository.dart';
import '../../domain/usecases/calculate_countdown.dart';

class CountdownRepositoryImpl implements CountdownRepository {
  const CountdownRepositoryImpl({
    CalculateCountdown calculator = const CalculateCountdown(),
  }) : _calculator = calculator;

  final CalculateCountdown _calculator;

  @override
  Future<Result<Countdown>> getMatchCountdown(
    DateTime kickoffUtc, {
    DateTime? nowUtc,
  }) async {
    return Success(_calculator(targetUtc: kickoffUtc, nowUtc: nowUtc));
  }

  @override
  Future<Result<Countdown>> getTournamentCountdown({DateTime? nowUtc}) async {
    return Success(
      _calculator(
        targetUtc: TournamentConstants.tournamentStartDateUtc,
        nowUtc: nowUtc,
      ),
    );
  }
}
