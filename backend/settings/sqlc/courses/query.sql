-- name: SelectCourses :many
SELECT id, name, description, grade_id, subject, level
FROM courses
WHERE deleted_at IS NULL;

-- name: SelectCourseByID :one
SELECT id, name, description, grade_id, subject, level
FROM courses
WHERE id = $1
  AND deleted_at IS NULL;

-- name: SelectTakingCoursesByUserID :many
SELECT c.id AS course_id, c.name, c.description, c.grade_id, c.subject, c.level
FROM courses c
JOIN lectures l ON l.course_id = c.id
JOIN user_progresses up ON up.lecture_id = l.id
WHERE up.user_id = $1
  AND l.deleted_at IS NULL
  AND c.deleted_at IS NULL
  AND NOT EXISTS (
      SELECT 1 FROM lectures l2
      WHERE l2.course_id = c.id
        AND l2.deleted_at IS NULL
        AND NOT EXISTS (
            SELECT 1 FROM user_progresses up2
            WHERE up2.lecture_id = l2.id
              AND up2.user_id = $1
        )
  )
GROUP BY c.id, c.name, c.description, c.grade_id, c.subject, c.level;

-- name: SelectFinishedCoursesByUserID :many
SELECT c.id AS course_id, c.name, c.description, c.grade_id, c.subject, c.level
FROM courses c
JOIN lectures l ON l.course_id = c.id
JOIN user_progresses up ON up.lecture_id = l.id
WHERE up.user_id = $1
  AND l.deleted_at IS NULL
  AND c.deleted_at IS NULL
  AND NOT EXISTS (
      SELECT 1 FROM lectures l2
      WHERE l2.course_id = c.id
        AND l2.deleted_at IS NULL
        AND EXISTS (
            SELECT 1 FROM user_progresses up2
            WHERE up2.lecture_id = l2.id
              AND up2.user_id = $1
        )
  )
GROUP BY c.id, c.name, c.description, c.grade_id, c.subject, c.level;

-- name: SelectLectureByID :one
SELECT id, course_id, name, description, prev, next, created_at
FROM lectures
WHERE id = $1
  AND deleted_at IS NULL;

-- name: DeleteLecture :exec
UPDATE lectures
SET deleted_at = now()
WHERE id = $1;

-- name: SelectLecturesByCourseID :many
SELECT id, name, description, prev, next
FROM lectures
WHERE course_id = $1
  AND deleted_at IS NULL;

-- name: SelectLecturesNotInProgress :many
SELECT id
FROM lectures
WHERE course_id = $1
  AND deleted_at IS NULL
  AND NOT EXISTS (
    SELECT 1 FROM user_progresses
    WHERE lecture_id = lectures.id
      AND user_id = $2
  );

-- name: GetOrderedLecturesByCourseID :many
WITH RECURSIVE ordered_lectures AS (
    SELECT l.id, l.course_id, l.name, l.description, l.prev, l.next, 1 as position
    FROM lectures l
    WHERE l.course_id = $1
      AND l.prev IS NULL
      AND l.deleted_at IS NULL
    UNION ALL
    SELECT l.id, l.course_id, l.name, l.description, l.prev, l.next, ol.position + 1
    FROM lectures l
    INNER JOIN ordered_lectures ol ON l.prev = ol.id
    WHERE l.course_id = $1
      AND l.deleted_at IS NULL
)
SELECT id, course_id, name, description, position
FROM ordered_lectures
ORDER BY position;

-- name: InsertUserProgress :one
INSERT INTO user_progresses (id, lecture_id, user_id)
VALUES ($1, $2, $3)
RETURNING id, lecture_id, user_id, created_at, updated_at;

-- name: SelectUserProgressByUserIDAndMonth :many
SELECT 
  to_char(created_at, 'YYYY-MM-DD') AS date, 
  ARRAY_AGG(lecture_id) AS lecture_ids
FROM user_progresses
WHERE user_id = $1
  AND to_char(created_at, 'YYYY-MM') = $2
  AND deleted_at IS NULL
GROUP BY date
ORDER BY date;


-- name: SelectOngoingProgressByUserID :many
SELECT lecture_id
FROM user_progresses
WHERE user_id = $1
  AND deleted_at IS NULL;

-- name: SelectUserProgressByLectureID :one
SELECT id, user_id, lecture_id
FROM user_progresses
WHERE lecture_id = $1
  AND user_id = $2;

-- name: SelectAllUserProgressByUserID :many
SELECT id, user_id, lecture_id
FROM user_progresses
WHERE user_id = $1;

-- name: CourseNameByID :one
SELECT name
FROM courses
WHERE id = $1
  AND deleted_at IS NULL;

-- name: GetLectureNameByID :one
SELECT name
FROM lectures
WHERE id = $1
  AND deleted_at IS NULL;

-- name: GetCourseIDByLectureID :one
SELECT course_id
FROM lectures
WHERE id = $1
  AND deleted_at IS NULL;

-- name: GetCourseIDsByLectureIDs :many
SELECT DISTINCT course_id
FROM lectures
WHERE id = ANY($1::TEXT[]);

-- name: GetCourseNamesByCourseIDs :many
SELECT name
FROM courses
WHERE id = ANY($1::TEXT[]);

-- name: GetLectureNamesByLectureIDs :many
SELECT id, name
FROM courses
WHERE id = ANY($1::TEXT[]);

-- name: GetCountLecturesByCourseIDs :many
SELECT course_id, COUNT(DISTINCT id)
FROM lectures
WHERE course_id = ANY($1::TEXT[])
GROUP BY course_id
ORDER BY created_at ASC;

-- name: GetCountLecturesByUser :many
SELECT course_id, COUNT(id)
FROM lectures
WHERE id = ANY($1::TEXT[])
GROUP BY course_id
ORDER BY created_at ASC;