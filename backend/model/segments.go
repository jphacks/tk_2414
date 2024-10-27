package model

type Material struct {
	Segment_id string `json:"segment_id"`
	Voice string `json:"voice"`
	Content string `json:"content"`
}

type SaveMaterial struct {
	Segment_id string `json:"segment_id"`
	Content string `json:"content"`
}

type SegmentTags struct {
	Segment_id string `json:"segment_id"`
	Tags []string `json:"tags"`
}

type ChatIDANDSegmentID struct {
	ChatID string `json:"chat_id"`
	SegmentID string `json:"segment_id"`
}
