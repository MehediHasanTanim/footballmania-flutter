import '../../../../core/utils/result.dart';
import '../entities/countdown.dart';
import '../repositories/countdown_repository.dart';
import 'calculate_countdown.dart';

class GetMatchCountdown {
  const GetMatchCountdown({
    CountdownRepository? repository,
    CalculateCountdown? calculator,
  }) : _repository = repository,
       _calculator = calculator ?? const CalculateCountdown();

  final CountdownRepository? _repository;
  final CalculateCountdown _calculator;

  Future<Result<Countdown>> call(DateTime kickoffUtc, {DateTime? nowUtc}) {
    final repository = _repository;
    if (repository != null) {
      return repository.getMatchCountdown(kickoffUtc, nowUtc: nowUtc);
    }
    return Future.value(
      Success(_calculator(targetUtc: kickoffUtc, nowUtc: nowUtc)),
    );
  }
}
