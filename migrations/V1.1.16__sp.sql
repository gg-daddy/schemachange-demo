-- 创建一个存储过程来插入数据
CREATE OR REPLACE PROCEDURE sample_database.sampleschema.insert_data_if_needed()
RETURNS STRING
LANGUAGE JAVASCRIPT
AS
$$
var result = snowflake.execute(
    {sqlText: "SELECT COUNT(*) AS row_count FROM sample_database.sampleschema.sampletable"}
);
var row_count = 0;

if (result.next()) {
    row_count = result.getColumnValue("ROW_COUNT");
}

if (row_count < 10) {
    snowflake.execute(
        {sqlText: "INSERT INTO sample_database.sampleschema.sampletable (id, name) VALUES (3, 'Charlie')"}
    );
    snowflake.execute(
        {sqlText: "COMMIT"}
    );
    return "Data inserted";
} else {
    return "No need to insert data";
}
$$;