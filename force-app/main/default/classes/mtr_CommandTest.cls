/**
 * MIT License
 * 
 * Copyright (c) 2019 Craig Ceremuga
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
 @isTest
private class mtr_CommandTest {
    @isTest
    private static void newInstance_nullArgument_expectValidationException() {
        try {
            Test.startTest();

            mtr_Command.newInstance(null);

            mtr_TestUtilities.expectedValidationException();
        } catch (Exception ex) {
            mtr_TestUtilities.assertValidationException(ex);
        } finally {
            Test.stopTest();
        }
    }

    @isTest
    private static void newInstance_nullApexClass_expectValidationException() {
        mtr_Command__mdt mockCommand = new mtr_Command__mdt();

        try {
            Test.startTest();

            mtr_Command.newInstance(mockCommand);

            mtr_TestUtilities.expectedValidationException();
        } catch (Exception ex) {
            mtr_TestUtilities.assertValidationException(ex);
        } finally {
            Test.stopTest();
        }
    }

    @isTest
    private static void newInstance_classDoesNotExist_expectValidationException() {
        mtr_Command__mdt mockCommand = new mtr_Command__mdt(mtr_ApexClass__c = 'zzBlahzz');

        try {
            Test.startTest();

            mtr_Command.newInstance(mockCommand);

            mtr_TestUtilities.expectedValidationException();
        } catch (Exception ex) {
            mtr_TestUtilities.assertValidationException(ex);
        } finally {
            Test.stopTest();
        }
    }

    @isTest
    private static void newInstance_invalidClassType_expectValidationException() {
        mtr_Command__mdt mockCommand = new mtr_Command__mdt(mtr_ApexClass__c = 'mtr_ValidationException');

        try {
            Test.startTest();

            mtr_Command.newInstance(mockCommand);

            mtr_TestUtilities.expectedValidationException();
        } catch (Exception ex) {
            mtr_TestUtilities.assertValidationException(ex);
        } finally {
            Test.stopTest();
        }
    }

    @isTest
    private static void newInstance_withRecord_expectWrapped() {
        mtr_Command__mdt mockCommand = new mtr_Command__mdt(
            mtr_ApexClass__c = 'mtr_MockCommand', 
            mtr_HasRun__c = true);

        Test.startTest();
        mtr_Command command = mtr_Command.newInstance(mockCommand);
        Test.stopTest();

        System.assertNotEquals(null, command, 'Did not expect a null command.');
        System.assertNotEquals(null, command.Implementation, 'Did not expect a null command.');
        System.assert(command.HasRun, 'Expected run.');
    }

    @isTest
    private static void newInstances_nullArgument_expectValidationException() {
        try {
            Test.startTest();

            mtr_Command.newInstances(null);

            mtr_TestUtilities.expectedValidationException();
        } catch (Exception ex) {
            mtr_TestUtilities.assertValidationException(ex);
        } finally {
            Test.stopTest();
        }
    }

    @isTest
    private static void newInstances_withRecords_expectWrapped() {
        mtr_Command__mdt mockCommand = new mtr_Command__mdt(mtr_ApexClass__c = 'mtr_MockCommand');

        Test.startTest();
        List<mtr_Command> commands = mtr_Command.newInstances(new List<mtr_Command__mdt> { mockCommand });
        Test.stopTest();

        System.assertNotEquals(null, commands, 'Did not expect null commands.');
        System.assertEquals(1, commands.size(), 'Expected one command.');
    }
}
