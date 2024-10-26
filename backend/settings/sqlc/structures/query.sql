-- name: GetLectureStructure :many
SELECT name, type
FROM structures
WHERE lecture_id = $1
  AND deleted_at IS NULL
ORDER BY created_at ASC;
