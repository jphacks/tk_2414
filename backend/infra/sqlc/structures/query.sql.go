// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.26.0
// source: query.sql

package structures

import (
	"context"
)

const getLectureStructure = `-- name: GetLectureStructure :many
SELECT name, type
FROM structures
WHERE lecture_id = $1
  AND deleted_at IS NULL
ORDER BY created_at ASC
`

type GetLectureStructureRow struct {
	Name string
	Type string
}

func (q *Queries) GetLectureStructure(ctx context.Context, lectureID string) ([]GetLectureStructureRow, error) {
	rows, err := q.db.QueryContext(ctx, getLectureStructure, lectureID)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []GetLectureStructureRow
	for rows.Next() {
		var i GetLectureStructureRow
		if err := rows.Scan(&i.Name, &i.Type); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}