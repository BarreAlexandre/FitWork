export PGUSER=fitwork_admin
export PGPASSWORD=fitwork
export PGHOST=localhost
#sqitch revert 1.create_tables
#sqitch revert 2.alter_mail
#sqitch revert 3.delete+gender
#sqitch revert 4.cascade_article
#sqitch revert 5.add_program_id
sqitch deploy 6.add_favorite_id
#sqitch deploy 7.populate2