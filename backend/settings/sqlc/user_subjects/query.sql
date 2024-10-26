-- name: InsertUserSubject :one
INSERT INTO user_subjects (id, user_id, subject_id)
VALUES ($1, $2, $3)
RETURNING id, user_id, subject_id, created_at, updated_at;

-- name: SelectSubjectIDsByUserID :many
SELECT subject_id
FROM user_subjects
WHERE user_id = $1
  AND deleted_at IS NULL;
