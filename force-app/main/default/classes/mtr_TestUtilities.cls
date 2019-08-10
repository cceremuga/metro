/**
 * @description Utilities for assisting with tests.
 */
@isTest
public with sharing class mtr_TestUtilities {
    private mtr_TestUtilities() { }

    /**
     * @description Used when it was expected a validation exception would be thrown, but none was.
     */
    public static void expectedValidationException() {
        System.assert(false, 'It was an expected a ValidationException would be thrown, but none was.');
    }

    /**
     * @description Asserts that a validation exception was thrown.
     * @param ex The exception to check.
     */
    public static void assertValidationException(Exception ex) {
        if (!(ex instanceof mtr_ValidationException)) {
            System.assert(false, 'Expected a ValidationException, but instead... ' + ex.getMessage());
        }
    }
}
