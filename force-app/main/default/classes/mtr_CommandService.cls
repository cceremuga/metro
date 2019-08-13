/**
 * @description Provides an access point for the execution of commands.
 */
public virtual with sharing class mtr_CommandService {
    @testVisible private static final String POST_DEPLOY_PHASE = 'Post Deploy';

    /**
     * @description Use the Instance singleton below.
     */
    private mtr_CommandService() { }

    /**
     * @description A singleton for interacting with all service methods.
     */
    public mtr_CommandService Instance {
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
    public void runEligiblePostDeploy() {
        runEligibleAndMarkComplete(POST_DEPLOY_PHASE);
    }

    private void runEligibleAndMarkComplete(String phase) {
        List<mtr_Command> completed = runEligible(phase);
        markAsComplete(completed);
    }

    private void markAsComplete(List<mtr_Command> completed) {
        // TODO mark all which were run so they are not run again.
    }

    @testVisible private List<mtr_Command> toRun;

    private List<mtr_Command> runEligible(String phase) {
        toRun = getEligible(phase);

        for (mtr_Command command : toRun) {
            command.Implementation.exec();
        }

        return toRun;
    }

    private List<mtr_Command> getEligible(String commandPhase) {
        List<mtr_Command> commands = new List<mtr_Command>();

        // TODO instantiate Command instances based upon retrieved MDT records.

        return commands;
    }

    private void getEligibleRecords(String commandPhase) {
        // TODO retrive all MDT records which have not been run for the specified phase.
    }
}
