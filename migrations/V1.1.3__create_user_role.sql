-- Create a role
CREATE ROLE my_role;
GRANT ALL PRIVILEGES ON DATABASE sample_database TO my_role;
-- Create a user and assign the role
CREATE USER my_user
    PASSWORD = 'my_password'
    DEFAULT_ROLE = my_role; 