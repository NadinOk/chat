-- User

DROP TABLE IF EXISTS user;
CREATE TABLE IF NOT EXISTS user
(
    user_id       INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name    TEXT,
    last_name     TEXT,
    login         TEXT NOT NULL,
    password      TEXT NOT NULL,
    creation_date INTEGER DEFAULT NULL
);

CREATE TRIGGER AutoGenerateDATETIME_user
    AFTER INSERT
    ON user
    FOR EACH ROW
    WHEN (NEW.creation_date IS NULL)
BEGIN
    UPDATE user
    SET creation_date = (strftime('%s', CURRENT_TIMESTAMP))
    WHERE rowid = NEW.rowid;
END;

INSERT INTO user (first_name, last_name, login, password)
VALUES ('John', 'Smith', 'user', 'yHib133sIzhCU');

INSERT INTO user (first_name, last_name, login, password)
VALUES ('Mary', 'Hopkins', 'lady', 'yH0gEKEZemiTc');

-- CREATE TRIGGER AutoGenerateGUID_user
--     AFTER INSERT
--     ON user
--     FOR EACH ROW
--     WHEN (NEW.user_id IS NULL)
-- BEGIN
--     UPDATE user
--     SET user_id = (select hex(randomblob(4)) || '-' || hex(randomblob(2))
--                               || '-' || '4' || substr(hex(randomblob(2)), 2) ||
--                           '-'
--                               || substr('AB89', 1 + (abs(random()) % 4), 1) ||
--                           substr(hex(randomblob(2)), 2) || '-' ||
--                           hex(randomblob(6)))
--     WHERE rowid = NEW.rowid;
-- END;

INSERT INTO 'user' ('login', 'first_name', 'last_name', 'password')
VALUES ('sociis.natoque.penatibus@nascetur.co.uk', 'Mari', 'Watson',
        'JZQ39TMB4ZZ'),
       ('pede@inlobortis.edu', 'Mason', 'Duran', 'CBH64WYO9TT'),
       ('ac.fermentum@adipiscingelit.com', 'Lance', 'Gardner', 'DKQ05CHV7OK'),
       ('imperdiet.ullamcorper.Duis@orciDonec.com', 'Brenden', 'Delgado',
        'FOA01IPA6QR'),
       ('urna.convallis.erat@Quisqueliberolacus.ca', 'Lareina', 'Frye',
        'MCQ63DCQ2LY'),
       ('mollis.Duis.sit@aauctor.ca', 'Devin', 'Ballard', 'EWE94ZLR8NY'),
       ('rhoncus.Nullam.velit@eratEtiamvestibulum.ca', 'Clarke', 'Shaw',
        'YDY08JXO9ZC'),
       ('vitae.nibh.Donec@magnaaneque.com', 'Veda', 'William', 'TKF85LWR4IT'),
       ('ac.ipsum@sitamet.co.uk', 'Yoshio', 'Chan', 'VDA88USW9FX'),
       ('ad.litora@tristiquepellentesque.ca', 'Bruce', 'Salazar',
        'NHY07VQY2WR'),
       ('amet.metus.Aliquam@Sedid.org', 'Daniel', 'Buckner', 'NND56TAH7FJ'),
       ('Maecenas.mi@torquentperconubia.co.uk', 'Rogan', 'Strickland',
        'KXK39BLI6GN'),
       ('Suspendisse@metus.org', 'Yvette', 'Franklin', 'OOV50CXO9SE'),
       ('cursus.in.hendrerit@aliquetmetus.net', 'Blaze', 'Olsen',
        'LBB10BTX5KG'),
       ('Phasellus.fermentum.convallis@non.co.uk', 'Vincent', 'Pierce',
        'ZHK79JNC7SD'),
       ('a@molestieSed.ca', 'Lionel', 'Osborn', 'SFK31FBE8PH'),
       ('mauris.Morbi@scelerisque.net', 'Bradley', 'Woodward', 'VIY43CON5RF'),
       ('eu.elit@SuspendisseduiFusce.ca', 'Pascale', 'Pittman', 'QRX66JCQ6JC'),
       ('nunc.ullamcorper.eu@Curabiturut.com', 'Cade', 'Crane', 'OSX74MXC0XG'),
       ('dapibus.gravida.Aliquam@quam.net', 'Jelani', 'Jacobson',
        'CNW05GFN3IY');

UPDATE user SET password = 'yHib133sIzhCU';