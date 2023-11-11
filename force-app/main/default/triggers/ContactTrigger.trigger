trigger ContactTrigger on Contact (after insert,after delete) {
    if(Trigger.isInsert){
        List<Id> accList = new List<Id>();
      
        for(Contact con:Trigger.new){
            accList.add(con.AccountId);
        }
        List<Account> accToUpdate = [Select id, Contact_Count__c,(Select id,Name from Contacts) from Account where id in :accList];
        for(Account acc:accToUpdate){
            acc.Contact_Count__c = acc.contacts.size();
        }
        update accToUpdate;
    }
    if(Trigger.isDelete){
        List<Id> accList = new List<Id>();
      
        for(Contact con:Trigger.old){
            accList.add(con.AccountId);
        }
        List<Account> accToUpdate = [Select id, Contact_Count__c,(Select id,Name from Contacts) from Account where id in :accList];
        for(Account acc:accToUpdate){
            acc.Contact_Count__c = acc.contacts.size();
        }
        update accToUpdate;
    }
        
    
    
    
}