// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0
// source: query.sql

package grades

import (
	"context"
)

const selectGradeNameByID = `-- name: SelectGradeNameByID :one
SELECT name
FROM grades
WHERE id = $1
  AND deleted_at IS NULL
`

func (q *Queries) SelectGradeNameByID(ctx context.Context, id string) (string, error) {
	row := q.db.QueryRowContext(ctx, selectGradeNameByID, id)
	var name string
	err := row.Scan(&name)
	return name, err
}
