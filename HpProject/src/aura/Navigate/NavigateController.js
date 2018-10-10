({ 
redirectToConsole : function(component, event, helper) { 
var urlEvent = $A.get("e.force:navigateToURL"); 
urlEvent.setParams({ 
"url":" https://rax--uat.lightning.force.com/lightning/cmp/AccountRedirect?accountNumber=5467987" 
}); 
console.log(urlEvent); 
urlEvent.fire(); 
} 
})