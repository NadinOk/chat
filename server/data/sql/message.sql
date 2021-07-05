-- Message

DROP TABLE IF EXISTS message;

CREATE TABLE message
(
    message_id    INTEGER PRIMARY KEY AUTOINCREMENT,
    text          TEXT    NOT NULL,
    chat_id       INTEGER NOT NULL,
    user_id       INTEGER NOT NULL,
    creation_date INTEGER NULL,
    type          INTEGER,
    is_deleted    INTEGER DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES user (user_id)
);

CREATE TRIGGER AutoGenerateDATETIME_message
    AFTER INSERT
    ON message
    FOR EACH ROW
    WHEN (NEW.creation_date IS NULL)
BEGIN
    UPDATE message
    SET creation_date = (strftime('%s', CURRENT_TIMESTAMP))
    WHERE rowid = NEW.rowid;
END;

-- C
INSERT INTO message (text, chat_id, user_id, type)
VALUES ('some text', 1, 1, 1);

-- R
-- SELECT *
-- FROM message
-- WHERE chat_id = 44
-- ORDER BY creation_date
-- LIMIT 1000 OFFSET 0;

-- SELECT * FROM message;
-- pages count (limit 10)
-- SELECT round((21 + (10 - 1)) / 10);

-- U
UPDATE message SET text = 'NEW TEXT' WHERE message_id = 1;

-- D
UPDATE message SET is_deleted = 1 WHERE message_id = 1;
