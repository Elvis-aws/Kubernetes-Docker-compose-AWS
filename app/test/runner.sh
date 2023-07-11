#!/bin/bash
mkdir -p logs

echo "$DOCKER_TEST_PARAM"

trap post_actions EXIT

post_actions()
{
    mv logs report/
    mv report.txt report/

#    Add additional functionality
#    scripts needs to be refactored
#    python log_collector.py
}

mkdir -p report
rm -rf report/*

pytest --reruns 2 -c pytest.ini --alluredir=report/allure 2>&1 | tee -a report.txt