@isTest
private class mtr_ValidationExceptionTest {
    @isTest
    private static void throwIfNull_withNullParam_expectExceptionThrown() {
        try {
            Test.startTest();

            mtr_ValidationException.throwIfNull(null, 'test');

            System.assert(false, 'No exception was thrown, and we expected one.');
        } catch (Exception ex) {
            System.assertEquals('test was expected to have a value, but has a null value.', 
                    ex.getMessage(), 'Expected the correct exception message.');
        } finally {
            Test.stopTest();
        }
    }
}
