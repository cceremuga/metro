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
private class mtr_CommandSelectorTest {
    @isTest
    private static void selectById_nullArgument_expectValidationException() {
        try {
            Test.startTest();

            mtr_CommandSelector.newInstance().selectById(null);

            mtr_TestUtilities.expectedValidationException();
        } catch (Exception ex) {
            mtr_TestUtilities.assertValidationException(ex);
        } finally {
            Test.stopTest();
        }
    }

    @isTest
    private static void selectById_withIds_expectNoException() {
        try {
            Test.startTest();

            mtr_CommandSelector.newInstance().selectById(new Set<Id>());
        } catch (Exception ex) {
            System.assert(false, 'Did not expect an exception to be thrown, but found: ' + ex.getMessage());
        } finally {
            Test.stopTest();
        }
    }

    @isTest
    private static void selectIncompleteByPhase_nullArgument_expectValidationException() {
        try {
            Test.startTest();

            mtr_CommandSelector.newInstance().selectIncompleteByPhase(null);

            mtr_TestUtilities.expectedValidationException();
        } catch (Exception ex) {
            mtr_TestUtilities.assertValidationException(ex);
        } finally {
            Test.stopTest();
        }
    }

    @isTest
    private static void selectIncompleteByPhase_withPhases_expectNotNull() {
        Test.startTest();
        List<Command__mdt> commands = mtr_CommandSelector.newInstance().selectIncompleteByPhase(new Set<String>());
        Test.stopTest();

        System.assertNotEquals(null, commands, 'Did not expect null commands.');
    }
}
