/**
 * @description Provides an access point for the execution of commands.
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
public virtual with sharing class mtr_CommandService {
    @testVisible private static final String POST_DEPLOY_PHASE = 'PostDeployment';

    /**
     * @description Use the Instance singleton below.
     */
    @testVisible
    protected mtr_CommandService() { }

    /**
     * @description A singleton for interacting with all service methods.
     */
    public static mtr_CommandService Instance {
        get {
            if (Instance == null) {
                Instance = new mtr_CommandService();
            }

            return Instance;
        }

        private set;
    }

    /**
     * @description Runs all configured post-deploy commands which have not been run once.
     *              Then, marks those commands as complete so they are not run in subsequent calls.
     */
    public void runPostDeploy() {
        runIncompleteAndMarkComplete(POST_DEPLOY_PHASE);
    }

    private void runIncompleteAndMarkComplete(String phase) {
        List<mtr_Command> completed = runIncomplete(phase);
        updateAsComplete(completed);
    }

    private void updateAsComplete(List<mtr_Command> completed) {
        for (mtr_Command completedCommand : completed) {
            completedCommand.HasRun = true;
        }

        // TODO: Mark all which were run so they are not run again.
    }

    @testVisible private List<mtr_Command> toRun;

    private List<mtr_Command> runIncomplete(String phase) {
        toRun = getIncomplete(phase);

        for (mtr_Command command : toRun) {
            command.Implementation.exec();
        }

        return toRun;
    }

    private List<mtr_Command> getIncomplete(String commandPhase) {
        List<mtr_Command__mdt> records = getIncompleteRecords(commandPhase);

        if (records.isEmpty()) {
            return new List<mtr_Command>();
        }

        return mtr_Command.newInstances(records);
    }

    private List<mtr_Command__mdt> getIncompleteRecords(String commandPhase) {
        return mtr_CommandSelector.newInstance().selectIncompleteByPhase(new Set<String> { commandPhase });
    }
}
