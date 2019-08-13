/**
 * @description Provides support to situations where an exception is warranted for validation failures.
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
