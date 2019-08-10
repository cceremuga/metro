/**
 * @description Provides support to situations where an exception is warranted for validation failures.
 */
public with sharing class mtr_ValidationException extends Exception {
    /**
    * @description Throws an exception if the provided parameter to check is null.
    * @param paramToCheck The parameter to check for a value.
    * @param The parameter's name.
    * @throws A mtr_ValidationException with a formatted message if paramToCheck is null.
    */
    public static void throwIfNull(Object paramToCheck, String name) {
        if (paramToCheck == null) {
            List<String> formatParams = new List<String> { name };
            throw new mtr_ValidationException(String.format(
                '{0} was expected to have a value, but has a null value.', formatParams));
        }
    }
}
