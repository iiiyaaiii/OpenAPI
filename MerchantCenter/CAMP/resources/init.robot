*** Settings ***
Resource    ${CURDIR}/../resources/configs/${ENV}/env_config.robot
Resource    ${CURDIR}/../keywords/common.robot
Library    SeleniumLibrary
Library    BuiltIn
Library    String
Library    Collections