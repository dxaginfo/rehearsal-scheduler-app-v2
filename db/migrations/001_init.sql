-- Rehearsal Scheduler DB Schema

CREATE TABLE users (
  id UUID PRIMARY KEY,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE NOT NULL,
  role VARCHAR(20),
  calendar_token TEXT
);

CREATE TABLE groups (
  id UUID PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE membership (
  user_id UUID REFERENCES users(id),
  group_id UUID REFERENCES groups(id),
  PRIMARY KEY(user_id, group_id)
);

CREATE TABLE events (
  id UUID PRIMARY KEY,
  title VARCHAR(255),
  location VARCHAR(255),
  group_id UUID REFERENCES groups(id),
  start_time TIMESTAMP,
  end_time TIMESTAMP,
  created_by UUID REFERENCES users(id)
);

CREATE TABLE attendance (
  event_id UUID REFERENCES events(id),
  user_id UUID REFERENCES users(id),
  status VARCHAR(20),
  PRIMARY KEY(event_id, user_id)
);
