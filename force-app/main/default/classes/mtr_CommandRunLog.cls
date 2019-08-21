/**
 * @description Wraps execution logs for commands when they have been run.
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
public with sharing class mtr_CommandRunLog {
    /**
     * @description Constructs a command run log wrapper.
     */
    public mtr_CommandRunLog() { }

    /**
     * @description The command which was run.
     */
    public String Command { get; set; }

    /**
     * @description The phase for which the command was run.
     */
    public String Phase { get; set; }

    /**
     * @description Any relevant details about the command execution.
     */
    public String Log { get; set; }

    /**
     * @description Converts the wrapper to its SObject representation.
     * @return An instance of mtr_CommandRunLog__c.
     */
    public mtr_CommandRunLog__c toSObject() {
        return new mtr_CommandRunLog__c(
            Name = this.Phase + '_' + this.Command,
            mtr_Command__c = this.Command,
            mtr_Phase__c = this.Phase,
            mtr_Log__c = this.Log
        );
    }
}
