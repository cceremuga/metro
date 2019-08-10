@isTest
private class mtr_ValidationExceptionTest {
    @isTest
    private static void throwIfNull_withNullParam_expectExceptionThrown() {
        try {
            Test.startTest();

            mtr_ValidationException.throwIfNull(null, 'Test');

            mtr_TestUtilities.expectedValidationException();
        } catch (Exception ex) {
            mtr_TestUtilities.assertValidationException(ex);
        } finally {
            Test.stopTest();
        }
    }
}
