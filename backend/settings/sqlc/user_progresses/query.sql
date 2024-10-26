-- name: InsertUserProgress :one
INSERT INTO user_progresses (id, lecture_id, user_id)
VALUES ($1, $2, $3)
RETURNING id, lecture_id, user_id, created_at, updated_at;

-- name: SelectUserProgressByUserIDAndMonth :many
SELECT lecture_id, created_at
FROM user_progresses
WHERE user_id = $1
  AND to_char(created_at, 'YYYY-MM') = $2
  AND deleted_at IS NULL;

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
