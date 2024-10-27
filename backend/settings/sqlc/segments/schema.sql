CREATE TABLE segments (
    id TEXT PRIMARY KEY,
    lecture_id TEXT NOT NULL,
    tags TEXT[] NOT NULL,
    prev TEXT NOT NULL,
    next TEXT NOT NULL,
    content TEXT NOT NULL,
    voice BYTEA NOT NULL,
    script TEXT NOT NULL,
    structure_id TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);

CREATE TABLE segments_local (
    id TEXT PRIMARY KEY,
    lecture_id TEXT NOT NULL,
    tags TEXT[] NOT NULL,
    prev TEXT NOT NULL,
    next TEXT NOT NULL,
    content TEXT NOT NULL,
    voice BYTEA NOT NULL,
    script TEXT NOT NULL,
    structure_id TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP WITH TIME ZONE
);