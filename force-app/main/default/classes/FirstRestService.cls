//To consume this service we need to run the url on workbench
//https://integrationcom5-dev-ed.develop.my.salesforce.com//services/apexrest/v1/Welcome
@RestResource(urlMapping='/v1/Welcome/*')
global with sharing class FirstRestService {
global final static string Welcome_msg='Welcome Messeg from Web Service';

    @httpGet
    global static string getGreetingMsg() {
        return Welcome_msg;
    }

    @httpPost
    global static string postGerrtingMsg(){
        return Welcome_msg;
    }

    @httpPatch
    global static string patchgreetingMsg(){
        return Welcome_msg+ ' Update with a patch';
    }
}