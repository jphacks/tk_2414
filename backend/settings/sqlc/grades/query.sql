-- name: SelectGradeNameByID :one
SELECT name
FROM grades
WHERE id = $1
  AND deleted_at IS NULL;
