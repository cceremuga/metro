@isTest
private class mtr_CommandServiceTest {
    @isTest
    private static void runPostDeploy_noneToRun_expectNoneRun() {
        Test.startTest();
        mtr_CommandService.Instance.runPostDeploy();
        Test.stopTest();

        System.assertNotEquals(null, mtr_CommandService.Instance.toRun, 'Did not expect null commands.');
        System.assertEquals(0, mtr_CommandService.Instance.toRun.size(), 'Expected no commands run.');
    }

    @isTest
    private static void runPostDeploy_withCommands_expectRun() {
        mtr_Command__mdt mockCommand = new mtr_Command__mdt(
            DeveloperName = 'Test',
            mtr_ApexClass__c = 'mtr_MockCommand');

        fflib_ApexMocks mocks = new fflib_ApexMocks();

        mtr_CommandSelector mockSelector = (mtr_CommandSelector) mocks.mock(mtr_CommandSelector.class);
        mtr_CommandSelector.mockInstance = mockSelector;

        mocks.startStubbing();
        mocks.when(mockSelector.selectIncompleteByPhase((Set<String>) fflib_Match.anyObject()))
            .thenReturn(new List<mtr_Command__mdt> { mockCommand });
        mocks.stopStubbing();

        Test.startTest();
        mtr_CommandService.Instance.runPostDeploy();
        Test.stopTest();

        System.assertNotEquals(null, mtr_CommandService.Instance.toRun, 'Did not expect null commands.');
        System.assertEquals(1, mtr_CommandService.Instance.toRun.size(), 'Expected one command.');

        mtr_Command runCommand = mtr_CommandService.Instance.toRun[0];

        mtr_MockCommand actualMockCommand = (mtr_MockCommand) (runCommand.Implementation);

        System.assert(actualMockCommand.hasRun, 'Expected executed.');

        List<mtr_CommandRunLog__c> runLogs = 
            [SELECT mtr_Command__c, mtr_Phase__c, mtr_Log__c FROM mtr_CommandRunLog__c];

        System.assertEquals(1, runLogs.size(), 'Expected one log.');

        mtr_CommandRunLog__c runLog = runLogs[0];

        System.assertEquals('Test', runLog.mtr_Command__c, 'Expected the correct command.');
        System.assertEquals('Unknown', runLog.mtr_Phase__c, 'Expected the correct phase.');
        System.assertEquals('Successful.', runLog.mtr_Log__c, 'Expected the correct log.');
    }
}
