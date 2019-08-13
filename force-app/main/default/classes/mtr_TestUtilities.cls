/**
 * @description Utilities for assisting with tests.
 * 
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
