CREATE OR REPLACE MASKING POLICY sample_database.sampleschema.mask_test_data AS
  (val STRING) RETURNS STRING ->
  CASE
    WHEN CURRENT_ROLE() IN ('ACCOUNTADMIN') THEN val
    ELSE '****'
  END;