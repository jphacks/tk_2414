-- name: CreateChat :one
INSERT INTO chats (id, user_id, segment_id)
VALUES ($1, $2, $3)
RETURNING id, user_id, segment_id, created_at;

-- name: GetChatByID :one
SELECT id, user_id, segment_id, created_at, updated_at
FROM chats
WHERE id = $1 AND deleted_at IS NULL;

-- name: DeleteChat :exec
UPDATE chats
SET deleted_at = now()
WHERE id = $1;

-- name: GetChatIdsByUserAndSegments :many
SELECT id, segment_id
FROM chats
WHERE user_id = $1
AND segment_id = ANY($2::text[]);
