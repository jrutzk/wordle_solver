GRANT USAGE ON SCHEMA wordle TO app_user;
GRANT INSERT, SELECT, UPDATE, DELETE ON ALL TABLES IN SCHEMA wordle TO app_user;
GRANT EXECUTE ON ALL FUNCTIONS IN SCHEMA wordle TO app_user;
ALTER DEFAULT PRIVILEGES IN SCHEMA wordle GRANT INSERT, SELECT ON TABLES TO app_user;

grant truncate on table wordle.grey to app_user;
grant truncate on table wordle.green to app_user;
grant truncate on table wordle.yellow to app_user;
