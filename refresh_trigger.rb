com = PG.connect :dbname => 'task', :user => 'nikolajkuzmenko'

com.exec "CREATE OR REPLACE FUNCTION mvw_book_refresh ( )
RETURNS trigger AS
$BODY$
BEGIN
  REFRESH MATERIALIZED VIEW mvw_book;
  RETURN NULL;
END
$BODY$
LANGUAGE plpgsql VOLATILE;"