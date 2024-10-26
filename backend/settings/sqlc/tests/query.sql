-- name: GetTestIDForLectureID :one
SELECT id 
FROM tests 
WHERE lecture_id = $1 
  AND deleted_at IS NULL;

-- name: GetQuestionsForTestID :many
SELECT id, text
FROM questions 
WHERE test_id = $1 
  AND deleted_at IS NULL
ORDER BY created_at ASC;

-- name: GetChoicesForQuestionIDs :many
SELECT id, text, is_correct
FROM choices 
WHERE question_id = ANY($1::TEXT[])
  AND deleted_at IS NULL;

-- name: PostQuizResult :exec
INSERT INTO quiz_results (id, user_id, test_id, question_id, choice_id)
VALUES (
  unnest($1::TEXT[]),
  unnest($2::TEXT[]),
  unnest($3::TEXT[]),
  unnest($4::TEXT[]),
  unnest($5::TEXT[])
);
