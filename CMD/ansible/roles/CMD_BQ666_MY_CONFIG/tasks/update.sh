#! /usr/bin/env bash
sed "/become: 'yes'/d" ../../CMD_ROOT_MY_CONFIG_GLOBAL/tasks/main.yml > main.yml
