*** Settings ***
Library    ../CanoeLibrary.py
Metadata  Caneo Version  V16.0
Metadata  ECU  BMS
Metadata  Tester  Nagarjuna Kellampalli


*** Variables ***
${CANOE_CONFIG}    c:/Users/Public/Documents/Vector/CANoe/Sample Configurations 19.6.18/CAN/Stress/Stress.cfg

*** Test Cases ***
Test case 184254
    [Documentation]  TC to verify CANoe_Application start and stop
    [Metadata]  Requirement   REQ-CAN-001
    [Tags]  CAN
    Start CANoe    ${CANOE_CONFIG}
    Sleep  2s
    Stop CANoe
    Save Configuration

Test case 184255
    [Documentation]  TC to verify speed signal value update
    [Metadata]  Requirement   REQ-CAN-002
    [Tags]  CAN
    Start CANoe    ${CANOE_CONFIG}
    Log    CANoe started successfully
    Start Logging    C:/Logs/TC_184255.blf
    Sleep  2s
    Set Signal  CAN  1  GTELS  NS1  21
    Validate Signal value  CAN  1  GTELS  NS1  21
    Stop Logging    
    Stop CANoe 
    Save Configuration
  

 
*** Keywords ***
Pre-Condition
    Start CANoe    ${CANOE_CONFIG}
    Sleep  2s
Post-Condition
    Stop CANoe  
    Save Configuration    