({
packItem : function(component, event, helper) {
       var a = component.get("v.item",true);
       a.packed__c = true;
       component.set("v.item",a);
       var btnclicked=event.getsource();
       btnclicked.set("v.disabled",true)
        
}
})