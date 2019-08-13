/**
 * @description Wraps the command MDT record and its constructed ICommand implementation.
 */
public with sharing class mtr_Command {
    public mtr_Command() {

    }

    public mtr_ICommand Implementation { get; private set; }

    // TODO Wrap the MDT record.
}
