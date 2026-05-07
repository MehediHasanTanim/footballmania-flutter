import '../../../../core/constants/tournament_constants.dart';
import '../../../../core/utils/result.dart';
import '../entities/countdown.dart';
import '../repositories/countdown_repository.dart';
import 'calculate_countdown.dart';

class GetTournamentCountdown {
  const GetTournamentCountdown({CountdownRepository? repository, CalculateCountdown? calculator})
    : _repository = repository,
      _calculator = calculator ?? const CalculateCountdown();

  final CountdownRepository? _repository;
  final CalculateCountdown _calculator;

  Future<Result<Countdown>> call({DateTime? nowUtc}) {
    final repository = _repository;
    if (repository != null) return repository.getTournamentCountdown(nowUtc: nowUtc);
    return Future.value(Success(_calculator(targetUtc: TournamentConstants.tournamentStartDateUtc, nowUtc: nowUtc)));
  }
}
