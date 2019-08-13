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

    private Command__mdt record;

    /**
     * @description Constructs a command, wrapping the specified record.
     * @param toWrap The Command__mdt to wrap.
     * @throws mtr_ValidationException if toWrap is null.
     */
    @testVisible
    protected mtr_Command(Command__mdt toWrap) {
        mtr_ValidationException.throwIfNull(toWrap, TO_WRAP_PARAM);

        this.record = toWrap;
        this.Implementation = constructImplementation();
    }

    /**
     * @description Constructs a command, wrapping the specified record.
     * @param toWrap The Command__mdt to wrap.
     * @throws mtr_ValidationException if toWrap is null.
     */
    public static mtr_Command newInstance(Command__mdt toWrap) {
        return new mtr_Command(toWrap);
    }

    /**
     * @description Constructs commands, wrapping the specified records.
     * @param toWrap The Command__mdt's to wrap.
     * @throws mtr_ValidationException if toWrap is null.
     */
    public static List<mtr_Command> newInstances(List<Command__mdt> toWrap) {
        List<mtr_Command> commands = new List<mtr_Command>();

        for (Command__mdt commandToWrap : toWrap) {
            commands.add(new mtr_Command(commandToWrap));
        }

        return commands;
    }

    public mtr_ICommand Implementation { get; private set; }

    private mtr_ICommand constructImplementation() {
        // TODO: Complete this.
        return null;
    }
}
