--Test for changing named dna team members from superuser to normal user without impacting day to day activities
alter user dna_vickie nocreateuser


--assume that test user has no user privileges granted and only the user group dna_team_admin_group assigned

--tests cover:
  --select from all schemas 
  --delete/update/insert/create in all schemas except global_poker and chumba_casino
  --drop an object that is not the user's owner.

  --able to select from:

      --original tables
      select * from global_poker.poker_user  --yes
      select * from chumba_casino.purchases --yes
      select * from rj2_gender --yes
    
      --newly created by the team
      select * from analytics_chumba_casino.fb_platform_position --no
      select * from dna_olap.campaign_ad_dim --no
      select * from test_schema.destination --no
      select * from backup_staging_marketo_last --no

      --views
      select * from rj2_users_all --no

  --able to update
  select * from fb_campaigns_old where campaign_id=6058618165123 and date='2016-08-15'
      --original value buying_type='AUCTION'
  update fb_campaigns_old set buying_type='AUCTION_XXX' where campaign_id=6058618165123 and date='2016-08-15'
      --to undo
      update fb_campaigns_old set buying_type='AUCTION' where campaign_id=6058618165123 and date='2016-08-15'
  
  --able to create
  select count(*) from fb_campaigns_old;
  CREATE TABLE fb_campaigns_old_copy(LIKE fb_campaigns_old);
  
  --able to insert
  insert into fb_campaigns_old_copy (select * from fb_campaigns_old);
  
  --able to drop
  select count(*) from fb_campaigns_old_copy;
  drop table fb_campaigns_old_copy;
  

--Exception tests
    --not able to update
        --original value value='XGC System Account'
        update global_poker.poker_accountattribute set value='XGC test test' where id=16 --permission denied
        select * from global_poker.poker_accountattribute where id=16
        update global_poker.poker_accountattribute set value='XGC System Account' where id=16 --undo if able to update....
        --original value adjustment_type='DEPOSIT_BONUS'
        update chumba_casino.adjustments set adjustment_type='DEPOSIT_XXX' where  pk=1536974 --permission denied
        select * from chumba_casino.adjustments where pk=1536974
        update chumba_casino.adjustments set adjustment_type='DEPOSIT_BONUS' where  pk=1536974 --undo if able to update....

    --not able to create
    CREATE TABLE global_poker.poker_scheduledtournamentconfiguration_copy(LIKE global_poker.poker_scheduledtournamentconfiguration);

    --not able to drop
    drop table global_poker.poker_scheduledtournamentconfiguration;
