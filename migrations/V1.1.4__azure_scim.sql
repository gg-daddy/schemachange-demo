create role if not exists aad_provisioner1;
grant create user,create role on account to role aad_provisioner1;
grant role aad_provisioner1 to role accountadmin;

create or replace security integration aad_provisioning1
    type = scim
    scim_client = 'azure'
    run_as_role = 'AAD_PROVISIONER1';

