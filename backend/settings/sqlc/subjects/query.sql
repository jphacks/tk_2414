-- name: SelectAllSubjects :many
SELECT id, name
FROM subjects
WHERE deleted_at IS NULL
ORDER BY created_at ASC;

-- name: SelectSubjectNameByID :one
SELECT name
FROM subjects
WHERE id = $1
  AND deleted_at IS NULL;
