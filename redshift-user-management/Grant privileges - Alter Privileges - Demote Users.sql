--1) Grant privileges to dna_team_admin_group

    --allow group to create new schemas: perhaps not needed for this group as data architect will remain a superuser and will manage schemas
    --GRANT ALL ON DATABASE dev TO group dna_team_admin_group;

    --admin schema
    GRANT ALL ON ALL tables in SCHEMA admin TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA admin TO group dna_team_admin_group;
    --analytics_chumba_casino schema
    GRANT ALL ON ALL tables in SCHEMA analytics_chumba_casino TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA analytics_chumba_casino TO group dna_team_admin_group;
    --analytics_global_poker schema
    GRANT ALL ON ALL tables in SCHEMA analytics_global_poker TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA analytics_global_poker TO group dna_team_admin_group;
    --analytics_marketo schema
    GRANT ALL ON ALL tables in SCHEMA analytics_marketo TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA analytics_marketo TO group dna_team_admin_group;
    --chumba_casino schema SELECT only
    GRANT SELECT ON ALL tables in SCHEMA chumba_casino TO group dna_team_admin_group;
    GRANT USAGE ON SCHEMA chumba_casino TO group dna_team_admin_group;
    --dna_olap schema
    GRANT ALL ON ALL tables in SCHEMA dna_olap TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA dna_olap TO group dna_team_admin_group;
    --facebook schema
    GRANT ALL ON ALL tables in SCHEMA facebook TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA facebook TO group dna_team_admin_group;
    --global_poker schema SELECT only
    GRANT SELECT ON ALL tables in SCHEMA global_poker TO group dna_team_admin_group;
    GRANT USAGE ON SCHEMA global_poker TO group dna_team_admin_group;
    --information_schema schema
    GRANT ALL ON ALL tables in SCHEMA information_schema TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA information_schema TO group dna_team_admin_group;
    --pg_catalog schema
    GRANT ALL ON ALL tables in SCHEMA pg_catalog TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA pg_catalog TO group dna_team_admin_group;
    --pg_internal schema --not allowed
--    GRANT ALL ON ALL tables in SCHEMA pg_internal TO group dna_team_admin_group;
--    GRANT ALL ON SCHEMA pg_internal TO group dna_team_admin_group;
    --public schema
    GRANT ALL ON ALL tables in SCHEMA public TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA public TO group dna_team_admin_group;
    --test_schema schema
    GRANT ALL ON ALL tables in SCHEMA test_schema TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA test_schema TO group dna_team_admin_group;
    --zendesk schema
    GRANT ALL ON ALL tables in SCHEMA zendesk TO group dna_team_admin_group;
    GRANT ALL ON SCHEMA zendesk TO group dna_team_admin_group;

--2) Alter Default privileges for schemas when tables are created

    ALTER DEFAULT PRIVILEGES FOR User 
    dna_vipul,
    dna_diana,
    dna_rimma,
    dna_jp,
    dna_denis,
    dna_tommy,
    dna_matt,
    dna_kenny,
    dna_vickie,
    dna_james,
    dna_brian,
    dna_seputro,
    dna_prajwal,
    chumba,
    dna_airflow

    IN SCHEMA  
    public,
    analytics_chumba_casino,
    analytics_global_poker,
    analytics_marketo,
    chumba_casino,
    dna_olap,
    facebook,
    global_poker,
    test_schema,
    zendesk
    GRANT SELECT ON TABLES TO GROUP dna_insight;

    ALTER DEFAULT PRIVILEGES FOR User 
    dna_vipul,
    dna_diana,
    dna_rimma,
    dna_jp,
    dna_denis,
    dna_tommy,
    dna_matt,
    dna_kenny,
    dna_vickie,
    dna_james,
    dna_brian,
    dna_seputro,
    dna_prajwal,
    chumba,
    dna_airflow

    IN SCHEMA  
    public,
    analytics_chumba_casino,
    analytics_global_poker,
    analytics_marketo,
    chumba_casino,
    dna_olap,
    facebook,
    global_poker,
    test_schema,
    zendesk
    GRANT SELECT ON TABLES TO GROUP tableau_readonly_group;
    
    ALTER DEFAULT PRIVILEGES FOR User 
    dna_vipul,
    dna_diana,
    dna_rimma,
    dna_jp,
    dna_denis,
    dna_tommy,
    dna_matt,
    dna_kenny,
    dna_vickie,
    dna_james,
    dna_brian,
    dna_seputro,
    dna_prajwal,
    chumba,
    dna_airflow

    IN SCHEMA  
    public,
    analytics_chumba_casino,
    analytics_global_poker,
    analytics_marketo,
    chumba_casino,
    dna_olap,
    facebook,
    global_poker,
    test_schema,
    zendesk
    GRANT SELECT ON TABLES TO GROUP airflow_group;
    

    ALTER DEFAULT PRIVILEGES FOR User 
    dna_vipul,
    dna_diana,
    dna_rimma,
    dna_jp,
    dna_denis,
    dna_tommy,
    dna_matt,
    dna_kenny,
    dna_vickie,
    dna_james,
    dna_brian,
    dna_seputro,
    dna_prajwal,
    chumba,
    dna_airflow

    IN SCHEMA  
    public,
    analytics_chumba_casino,
    analytics_global_poker,
    analytics_marketo,
    chumba_casino,
    dna_olap,
    facebook,
    global_poker,
    test_schema,
    zendesk
    GRANT SELECT ON TABLES TO GROUP tss_team_admin_group;
    
    ALTER DEFAULT PRIVILEGES FOR User 
    dna_vipul,
    dna_diana,
    dna_rimma,
    dna_jp,
    dna_denis,
    dna_tommy,
    dna_matt,
    dna_kenny,
    dna_vickie,
    dna_james,
    dna_brian,
    dna_seputro,
    dna_prajwal,
    chumba,
    dna_airflow

    IN SCHEMA  
    public,
    analytics_chumba_casino,
    analytics_global_poker,
    analytics_marketo,
    chumba_casino,
    dna_olap,
    facebook,
    global_poker,
    test_schema,
    zendesk
    GRANT SELECT ON TABLES TO GROUP tss_team_readonly_group;
    

    ALTER DEFAULT PRIVILEGES FOR User 
    dna_vipul,
    dna_diana,
    dna_rimma,
    dna_jp,
    dna_denis,
    dna_tommy,
    dna_matt,
    dna_kenny,
    dna_vickie,
    dna_james,
    dna_brian,
    dna_seputro,
    dna_prajwal,
    chumba,
    dna_airflow

    IN SCHEMA  
    public,
    analytics_chumba_casino,
    analytics_global_poker,
    analytics_marketo,
    chumba_casino,
    dna_olap,
    facebook,
    global_poker,
    test_schema,
    zendesk
    GRANT all ON TABLES TO GROUP dna_team_admin_group;


--3) 
  --demote all dna team members from superuser to normal user except dna_denis, dna_vipul and dna_airflow
  alter user dna_diana nocreateuser;
  alter user dna_james nocreateuser;
  alter user dna_jp nocreateuser;
  alter user dna_kenny nocreateuser;
  alter user dna_matt nocreateuser;
  alter user dna_prajwal nocreateuser;
  alter user dna_rimma nocreateuser;
  alter user dna_seputro nocreateuser;
  alter user dna_tommy nocreateuser;
  alter user dna_brian nocreateuser;
  alter user dna_vickie nocreateuser;



--4) Test...

  CREATE TABLE facebook.test_default_privilege3(LIKE facebook.campaign);
  drop table facebook.test_default_privilege1
  CREATE TABLE facebook.test_default_privilege1(LIKE facebook.campaign);

  select * from facebook.test_default_privilege3
  select * from facebook.test_default_privilege1
  select * from facebook.test_default_privilege2
  select * from facebook.test_default_privileges1
  
  drop table facebook.test_default_privileges1
  CREATE TABLE facebook.test_default_privileges1(LIKE facebook.campaign);
  

--5) Undo...

  alter user dna_diana createuser;
  alter user dna_james createuser;
  alter user dna_jp createuser;
  alter user dna_kenny createuser;
  alter user dna_matt createuser;
  alter user dna_prajwal createuser;
  alter user dna_rimma createuser;
  alter user dna_seputro createuser;
  alter user dna_tommy createuser;
  alter user dna_vickie createuser;
  


