@RestResource(urlMapping='/v1/Account/*')
global with sharing class AccountManager {
    
    @httpGet
    global static AccountWrapper accountInformation(){
        RestRequest request = RestContext.request;
        RestResponse res = RestContext.response;
        string requestURI = request.requestURI;
        String accountID=requestURI.substringAfterLast('/');

        List<Account> accList = [Select ID, Name, Rating, Industry, Description, Phone, Fax from Account where id=:accountID];
        List<Contact> conList = [Select Id, Name, FirstName from Contact where AccountId=:accountID];
        List<Case> caseList = [Select Id, CaseNumber, Subject from Case where AccountId=:accountID];

        AccountWrapper accWrapper = new AccountWrapper();
        if(!accList.isEmpty())
        {
            accWrapper.accList = accList;
            accWrapper.conList = conList;
            accWrapper.caseList = caseList;
        }

        return accWrapper;
    }

    global class AccountWrapper{
        global List<Account> accList;
        global List<Contact> ConList;
        global List<Case> CaseList;
    }
}