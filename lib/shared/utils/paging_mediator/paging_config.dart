class PagingConfig {
  const PagingConfig({
    required this.pageSize,
    this.prefetchIndex = 3,
    int? initialLoadSize,
    this.maxSize,
  })  : initialLoadSize = initialLoadSize ?? pageSize * initialPageMultiplier,
        assert(
          prefetchIndex == null || prefetchIndex <= pageSize / 2,
          'Prefetch index must be less than pageSize / 2',
        ),
        assert(
          maxSize == null || maxSize >= pageSize * 3,
          'Maximum size must be at least 3 * pageSize',
        );

  static const initialPageMultiplier = 3;

  final int pageSize;
  final int? prefetchIndex;
  final int initialLoadSize;
  final int? maxSize;
}
