-- name: SaveMaterials :exec
INSERT INTO segments_local (id, content, user_id)
SELECT unnest($1::text[]), unnest($2::text[]), $3::text
ON CONFLICT (id) DO UPDATE
SET content = EXCLUDED.content, updated_at = now(), user_id = EXCLUDED.user_id;

-- name: GetMaterialsForLecture :many
WITH RECURSIVE ordered_segments AS (
    SELECT s.id AS segment_id, s.voice, s.content, s.next
    FROM segments s  -- テーブルエイリアス "s" を追加
    WHERE s.lecture_id = $1  -- lecture_id に "s" を追加して曖昧さを解消
      AND s.prev IS NULL
      AND s.deleted_at IS NULL

    UNION ALL

    SELECT s.id AS segment_id, s.voice, s.content, s.next
    FROM segments s
    INNER JOIN ordered_segments os ON s.id = os.next
    WHERE s.deleted_at IS NULL
)
SELECT segment_id, voice, content
FROM ordered_segments;

-- name: DeleteSegment :exec
UPDATE segments
SET deleted_at = now()
WHERE id = $1;

-- name: GetSegmentTagsByLectureID :many
SELECT id, tags
FROM segments
WHERE lecture_id = $1;

-- name: GetSegmentsByLectureID :many
SELECT id
FROM segments
WHERE lecture_id = $1;