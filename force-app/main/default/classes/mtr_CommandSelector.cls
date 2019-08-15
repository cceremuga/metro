/**
 * @description Selector for retrieving Command__mdt records.
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
public virtual with sharing class mtr_CommandSelector extends fflib_SObjectSelector {
    @testVisible private static final String IDS_PARAM = 'ids';
    @testVisible private static final String PHASES_PARAM = 'phases';

    /**
     * @description For mocking purposes only, use newInstance instead.
     */
    @testVisible protected mtr_CommandSelector() { }

    @testVisible private static mtr_CommandSelector mockInstance;

    /**
     * @description Constructs an instance of mtr_CommandSelector.
     */
    public static mtr_CommandSelector newInstance() {
        if (mockInstance != null && Test.isRunningTest()) {
            return mockInstance;
        }

        return new mtr_CommandSelector();
    }

    /**
     * @description Retrieves Command__mdt records by Id.
     * @param ids The ids to select by.
     * @throws ArgumentNullException if ids is null.
     */
    public List<Command__mdt> selectById(Set<Id> ids) {
        mtr_ValidationException.throwIfNull(ids, IDS_PARAM);

        return (List<Command__mdt>) selectSObjectsById(ids);
    }

    /**
     * @description Retrieves incomplete Command__mdt records by phase.
     * @param phases The phases to select by.
     * @throws ArgumentNullException if phases is null.
     */
    public List<Command__mdt> selectIncompleteByPhase(Set<String> phases) {
        mtr_ValidationException.throwIfNull(phases, PHASES_PARAM);

        fflib_QueryFactory factory = newQueryFactory(true)
            .setCondition('Phase__r.DeveloperName IN :phases');

        return (List<Command__mdt>) Database.query(factory.toSOQL());
    }

    protected List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField> {
            Command__mdt.ApexClass__c,
            Command__mdt.DeveloperName,
            Command__mdt.Id,
            Command__mdt.MasterLabel,
            Command__mdt.Phase__c
        };
    }
    
    protected Schema.SObjectType getSObjectType() {
        return Command__mdt.sObjectType;
    }
}
