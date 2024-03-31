part of 'bootcamp_list_bloc.dart';

@immutable
sealed class BootcampListEvent {}

final class BootcampListFetch extends BootcampListEvent {}

final class BootcampListRefresh extends BootcampListEvent {}

final class BootcampListLoadMore extends BootcampListEvent {}

final class BootcampListSearch extends BootcampListEvent {
  final String query;
  BootcampListSearch(this.query);
}

final class BootcampListFilter extends BootcampListEvent {
  final List<String> filters;
  BootcampListFilter(this.filters);
}
