DBS=$(mysql -h devdb -BNe "show databases like '%v4net' ")
echo $DBS
for DB in $DBS; do
echo $DB
mysql -h devdb $DB < sql_scripts/waops-1070.sql
done

