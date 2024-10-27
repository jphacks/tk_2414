-- name: SendMessage :one
INSERT INTO messages (id, is_user, chat_id, message)
VALUES ($1, $2, $3, $4)
RETURNING id, is_user, chat_id, message, created_at;

-- name: GetMessageByChatID :many
SELECT id, is_user, chat_id, message, created_at
FROM messages
WHERE chat_id = $1 AND deleted_at IS NULL
ORDER BY created_at ASC;

-- name: DeleteMessage :exec
UPDATE messages
SET deleted_at = now()
WHERE id = $1;

-- name: GetMessagesByChatIDs :many
SELECT id, chat_id, message, is_user, created_at
FROM messages
WHERE chat_id = ANY($1::text[]);