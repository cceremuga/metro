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
        Command__mdt mockCommand = new Command__mdt(
            ApexClass__c = 'mtr_MockCommand', 
            HasRun__c = false);

        fflib_ApexMocks mocks = new fflib_ApexMocks();

        mtr_CommandSelector mockSelector = (mtr_CommandSelector) mocks.mock(mtr_CommandSelector.class);
        mtr_CommandSelector.mockInstance = mockSelector;

        mocks.startStubbing();
        mocks.when(mockSelector.selectIncompleteByPhase((Set<String>) fflib_Match.anyObject()))
            .thenReturn(new List<Command__mdt> { mockCommand });
        mocks.stopStubbing();

        Test.startTest();
        mtr_CommandService.Instance.runPostDeploy();
        Test.stopTest();

        System.assertNotEquals(null, mtr_CommandService.Instance.toRun, 'Did not expect null commands.');
        System.assertEquals(1, mtr_CommandService.Instance.toRun.size(), 'Expected one command.');

        mtr_Command runCommand = mtr_CommandService.Instance.toRun[0];

        System.assert(runCommand.HasRun, 'Expected the one command ran.');

        mtr_MockCommand actualMockCommand = (mtr_MockCommand) (runCommand.Implementation);

        System.assert(actualMockCommand.hasRun, 'Expected executed.');
    }

    @isTest
    private static void runPostDeploy_withCommands_expectMarkedAsRun() {
        // TODO: Complete this.
    }
}
