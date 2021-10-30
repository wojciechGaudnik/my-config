#! /usr/bin/env bash
sed "s/become: 'yes'/become: 'no'/g; s/reg_root_git_pull_config_repo/reg_bq666_git_pull_config_repo/g" ../../CMD_ROOT_MY_CONFIG_GLOBAL/tasks/main.yml > main.yml
