import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:time_machine/time_machine.dart';

part 'local_date_time.freezed.dart';

enum MathematicalIntervalType {
  open,
  leftOpen,
  rightOpen,
  closed,
}

@Freezed(toJson: false)
class LocalDateRange with _$LocalDateRange {
  const LocalDateRange._();

  const factory LocalDateRange({
    required LocalDate start,
    required LocalDate end,
  }) = _LocalDateRange;

  /// 与えられた日付が、期間内であるかどうかを返す
  ///
  /// * [target] 期間の基準となる日付
  /// * [range] 期間
  /// * [includeStart] 期間の開始日を含めるかどうか
  /// * [includeEnd] 期間の終了日を含めるかどうか
  ///
  /// Returns: 期間内であるかどうか
  bool dateIsInRange({
    required LocalDate target,
    bool includeStart = true,
    bool includeEnd = true,
  }) {
    return (includeStart ? 0 : 1) <= target.compareTo(start) &&
        target.compareTo(end) <= (includeEnd ? 0 : -1);
  }

  LocalDate get intermediate => start.addDays(
        (start.differenceAbs(end).inDays / 2).round(),
      );

  List<LocalDate> get allDates => [
        for (var i = 0; i <= start.differenceAbs(end).inDays; i++)
          start.addDays(i),
      ];
}

@Freezed(toJson: false)
class LocalDateTimeRange with _$LocalDateTimeRange {
  const LocalDateTimeRange._();

  const factory LocalDateTimeRange({
    required LocalDateTime start,
    required LocalDateTime end,
  }) = _LocalDateTimeRange;

  factory LocalDateTimeRange.fromDateTimeRange(DateTimeRange range) {
    return LocalDateTimeRange(
      start: LocalDateTime.dateTime(range.start.toLocal()),
      end: LocalDateTime.dateTime(range.end.toLocal()),
    );
  }

  factory LocalDateTimeRange.fromLocalDateRange(LocalDateRange range) {
    return LocalDateTimeRange(
      start: range.start.atMidnight(),
      end: range.end.atMidnight(),
    );
  }

  LocalDateRange toLocalDateRange({
    MathematicalIntervalType inputInterval = MathematicalIntervalType.rightOpen,
    MathematicalIntervalType outputInterval = MathematicalIntervalType.closed,
  }) {
    final inputStart = [
      MathematicalIntervalType.leftOpen,
      MathematicalIntervalType.open,
    ].contains(inputInterval)
        ? start.addNanoseconds(1)
        : start;
    final outputStart = [
      MathematicalIntervalType.leftOpen,
      MathematicalIntervalType.open,
    ].contains(outputInterval)
        ? inputStart.calendarDate.addDays(1)
        : inputStart.calendarDate;
    final inputEnd = [
      MathematicalIntervalType.rightOpen,
      MathematicalIntervalType.open,
    ].contains(inputInterval)
        ? end.subtractNanoseconds(1)
        : end;
    final outputEnd = [
      MathematicalIntervalType.rightOpen,
      MathematicalIntervalType.open,
    ].contains(outputInterval)
        ? inputEnd.calendarDate.subtractDays(1)
        : inputEnd.calendarDate;

    return LocalDateRange(
      start: outputStart,
      end: outputEnd,
    );
  }
}

@Freezed(toJson: false)
class SelectedLocalDateRange with _$SelectedLocalDateRange {
  const SelectedLocalDateRange._();

  const factory SelectedLocalDateRange({
    LocalDate? start,
    LocalDate? end,
  }) = _SelectedLocalDateRange;

  bool get neitherSelected => start == null && end == null;
  bool get bothSelected => start != null && end != null;
  bool get isSelecting =>
      (start != null && end == null) || (start == null && end != null);
}

abstract final class TimeMachineUtils {
  /// 与えられた日付と長さから、期間を計算する
  ///
  /// * [target] 期間の基準となる日付
  /// * [period] 期間の長さ
  /// * [limitMin] 期間の最小値
  /// * [limitMax] 期間の最大値
  /// * [includeTargetDay] 期間に基準日を含めるかどうか
  ///
  /// Returns: min(target - period, limitMin) 〜 max(target + period, limitMax)
  static LocalDateRange getDateRangeFromDuration({
    required LocalDate target,
    required Period period,
    LocalDate? limitMin,
    LocalDate? limitMax,
    bool includeTargetDay = true,
  }) {
    final minDayCalculatedBySelectedDay =
        includeTargetDay && period.normalize().hasDateComponent
            ? target.subtract(period - const Period(days: 1))
            : target.subtract(period);
    final maxDayCalculatedBySelectedDay =
        includeTargetDay && period.normalize().hasDateComponent
            ? target.add(period - const Period(days: 1))
            : target.add(period);

    final minDayToUse = limitMin == null
        ? minDayCalculatedBySelectedDay
        : minDayCalculatedBySelectedDay.compareTo(limitMin) > 0
            ? minDayCalculatedBySelectedDay
            : limitMin;
    final maxDayToUse = limitMax == null
        ? maxDayCalculatedBySelectedDay
        : maxDayCalculatedBySelectedDay.compareTo(limitMax) < 0
            ? maxDayCalculatedBySelectedDay
            : limitMax;
    return LocalDateRange(
      start: minDayToUse,
      end: maxDayToUse,
    );
  }
}

extension LocalDateEx on LocalDate {
  static LocalDate? dateTimeOrNull(DateTime? dateTime) =>
      dateTime == null ? null : LocalDate.dateTime(dateTime);

  /// 与えられた日付が、期間内であるかどうかを返す
  ///
  /// * [range] 期間
  /// * [includeStart] 期間の開始日を含めるかどうか
  /// * [includeEnd] 期間の終了日を含めるかどうか
  ///
  /// Returns: 期間内であるかどうか
  bool isDateInRange({
    required LocalDateRange range,
    bool includeStart = true,
    bool includeEnd = true,
  }) =>
      range.dateIsInRange(
        target: this,
        includeStart: includeStart,
        includeEnd: includeEnd,
      );

  static LocalDate parse(String value) =>
      LocalDate.dateTime(DateTime.parse(value).toLocal());

  /// 日付が今日を含む週に含まれるか
  bool get isInThisWeek => isDateInRange(
        range: LocalDate.today().weekDateRange,
      );

  /// 日曜日始まり
  LocalDate atStartOfWeek() =>
      subtractDays(dayOfWeek.value % DateTime.daysPerWeek);

  LocalDate atEndOfWeek() =>
      addDays(6 - dayOfWeek.value % DateTime.daysPerWeek);

  LocalDateRange get weekDateRange => LocalDateRange(
        start: atStartOfWeek(),
        end: atEndOfWeek(),
      );

  LocalDateRange get monthDateRange => LocalDateRange(
        start: atStartOfMonth(),
        end: atEndOfMonth(),
      );

  LocalDate atStartOfMonth() => LocalDate(year, monthOfYear, 1);

  LocalDate atEndOfMonth() => atStartOfMonth().addMonths(1).subtractDays(1);

  LocalDate atStartOfYear() => LocalDate(year, 1, 1);

  LocalDate atEndOfYear() => LocalDate(year, 12, 31);

  Duration differenceAbs(LocalDate target) =>
      atMidnight().differenceAbs(target.atMidnight());

  bool get isToday => equals(LocalDate.today());

  YearMonth toYearMonth() => YearMonth(
        year: year,
        month: monthOfYear,
      )..normalize();
}

extension LocalDateTimeEx on LocalDateTime {
  static LocalDateTime? dateTimeOrNull(DateTime? dateTime) =>
      dateTime == null ? null : LocalDateTime.dateTime(dateTime.toLocal());

  LocalDateTime atStartOfSecond() => LocalDateTime(
        year,
        monthOfYear,
        dayOfMonth,
        hourOfDay,
        minuteOfHour,
        secondOfMinute,
      );

  LocalDateTime atStartOfMinute() =>
      atStartOfSecond().subtractSeconds(secondOfMinute);

  LocalDateTime atStartOfHour() =>
      atStartOfMinute().subtractMinutes(minuteOfHour);

  LocalDateTime atStartOfDay() => atStartOfHour().subtractHours(hourOfDay);

  String toIso8601String() =>
      inZoneStrictly(DateTimeZone.local).toDateTimeUtc().toIso8601String();

  static LocalDateTime parse(String value) =>
      LocalDateTime.dateTime(DateTime.parse(value).toLocal());

  static LocalDateTime fromMillisecondsSinceEpoch(int millisecondsSinceEpoch) =>
      LocalDateTime.dateTime(
        DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch).toLocal(),
      );

  Duration differenceAbs(LocalDateTime target) =>
      LocalDateTime.max(this, target)
          .toDateTimeLocal()
          .difference(LocalDateTime.min(this, target).toDateTimeLocal());

  int get millisecondsSinceEpochUtc =>
      toDateTimeLocal().toUtc().millisecondsSinceEpoch;
}

extension DurationExTimeMachine on Duration {
  /// 与えられた期間を、TimeMachineの期間に変換する
  Period get toPeriod => Period(
        microseconds: inMicroseconds,
      ).normalize();
}

extension DateTimeRangeEx on DateTimeRange {
  DateTime get intermediate => start.add(
        Duration(
          milliseconds: (end.difference(start).inMilliseconds / 2).round(),
        ),
      );

  LocalDateTimeRange toLocalDateTimeRange() =>
      LocalDateTimeRange.fromDateTimeRange(this);

  LocalDateRange toLocalDateRange() =>
      toLocalDateTimeRange().toLocalDateRange();
}

@Freezed(toJson: false)
class YearMonth with _$YearMonth {
  const YearMonth._();

  const factory YearMonth({
    required int year,
    required int month,
  }) = _YearMonth;

  YearMonth normalize() {
    final normalizedMonth = (month - 12) % 12;
    final normalizedYear = year + (month - 12) ~/ 12;
    return YearMonth(
      year: normalizedYear,
      month: normalizedMonth,
    );
  }

  LocalDate atStartOfMonth() {
    return LocalDate(year, month, 1).atStartOfMonth();
  }

  LocalDate atEndOfMonth() {
    return LocalDate(year, month, 1).atEndOfMonth();
  }

  bool equals(YearMonth other) {
    return year == other.year && month == other.month;
  }
}
