# Background work with WorkManager

Komikku has about 11 `CoroutineWorker` classes. Mihon has about 7.

## Where to read

- `app/src/main/java/eu/kanade/tachiyomi/data/library/LibraryUpdateJob.kt`: `class LibraryUpdateJob(...) : CoroutineWorker(...)`, `doWork()` at line 141.
- `app/src/main/java/eu/kanade/tachiyomi/data/backup/create/BackupCreateJob.kt`
- `app/src/main/java/eu/kanade/tachiyomi/data/download/DownloadJob.kt`
- `app/src/main/java/eu/kanade/domain/track/service/DelayedTrackingUpdateJob.kt`

## Pattern

1. Extend `CoroutineWorker` and implement `doWork(): Result`.
2. Enqueue with `WorkManager` (periodic or one-time) from a helper like `LibraryUpdateJob.setupTask()`.
3. Return `Result.success()`, `Result.retry()`, or `Result.failure()`.

## Exercise

1. Read `LibraryUpdateJob.doWork()` and list the exit paths.
2. Find where the job is enqueued and what constraints it uses.
