#!/bin/bash

date > /home/isucon/bench-kun.log

echo 'alter table memos add column username varchar(255) null;' | mysql -u isucon isucon
echo 'alter table users add index username(`username`);' | mysql -u isucon isucon
echo 'update memos as m, users as u set m.username = u.username where m.user = u.id;' | mysql -u isucon isucon
echo 'alter table memos add index is_private_and_created_at(`is_private`, `created_at`);' | mysql -u isucon isucon

echo 'alter table memos;' | mysql -u isucon isucon
echo 'alter table users;' | mysql -u isucon isucon

echo 'initialized!' >> /home/isucon/bench-kun.log
