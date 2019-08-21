/**
 * @description Wraps the command MDT record and its constructed ICommand implementation.
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
public virtual with sharing class mtr_Command {
    @testVisible private static final String TO_WRAP_PARAM = 'toWrap';

    private mtr_Command__mdt record;

    /**
     * @description Constructs a command, wrapping the specified record.
     * @param toWrap The Command__mdt to wrap.
     * @throws mtr_ValidationException if toWrap is null or does not satify construction requirements.
     */
    @testVisible
    protected mtr_Command(mtr_Command__mdt toWrap) {
        mtr_ValidationException.throwIfNull(toWrap, TO_WRAP_PARAM);

        this.record = toWrap;
        this.Implementation = constructImplementation();
    }

    /**
     * @description Constructs a command, wrapping the specified record.
     * @param toWrap The Command__mdt to wrap.
     * @throws mtr_ValidationException if toWrap is null.
     */
    public static mtr_Command newInstance(mtr_Command__mdt toWrap) {
        return new mtr_Command(toWrap);
    }

    /**
     * @description Constructs commands, wrapping the specified records.
     * @param toWrap The Command__mdt's to wrap.
     * @throws mtr_ValidationException if toWrap is null.
     */
    public static List<mtr_Command> newInstances(List<mtr_Command__mdt> toWrap) {
        mtr_ValidationException.throwIfNull(toWrap, TO_WRAP_PARAM);

        List<mtr_Command> commands = new List<mtr_Command>();

        for (mtr_Command__mdt commandToWrap : toWrap) {
            commands.add(new mtr_Command(commandToWrap));
        }

        return commands;
    }

    /**
     * @description The command to execute.
     */
    public mtr_ICommand Implementation { get; private set; }

    /**
     * @description The label for this command.
     */
    public String DeveloperName {
        get {
            return this.record.DeveloperName;
        }
    }

    /**
     * @description The phase for this command.
     */
    public String Phase {
        get {
            if (this.record.mtr_Phase__c == null) {
                return 'Unknown';
            }

            return this.record.mtr_Phase__r.DeveloperName;
        }
    }

    private mtr_ICommand constructImplementation() {
        String className = this.record.mtr_ApexClass__c;

        if (String.isBlank(className)) {
            throw new mtr_ValidationException('Apex class cannot be blank.');
        }

        Type specifiedType = Type.forName(className);

        if (specifiedType == null) {
            throw new mtr_ValidationException(String.format('Class ({0}) could not be found.', new List<String> {
                className
            }));
        }

        Object instance = specifiedType.newInstance();

        if (!(instance instanceof mtr_ICommand)) {
            throw new mtr_ValidationException(String.format('Class ({0}) was not an implementation of mtr_ICommand.', 
                new List<String> { className }));
        }

        return (mtr_ICommand) instance;
    }
}
