#! /usr/bin/env bash
sed "s/become: 'yes'/become: 'no'/g; s/reg_root_git_pull_config_repo/reg_bq666_git_pull_config_repo/g" ~/.my-config/CMD/ansible/roles/CMD_ROOT_MY_CONFIG_GLOBAL/tasks/main.yml > ~/.my-config/CMD/ansible/roles/CMD_BQ666_MY_CONFIG/tasks/main.yml
