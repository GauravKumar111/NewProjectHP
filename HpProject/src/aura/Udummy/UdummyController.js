({
	dosubmit : function(cmp, evt, hlpr) {
        //call apex function SaveRegistrationDetail to save data in reg Form
        //also we have to pass RegForm as parameter
       var RegForm = cmp.get("v.RegForm");
        
        //create a one time use instance of the SaveRegistrationDetail action
        //in the server side controller
		var action = cmp.get("c.SaveRegistrationDetail");
        action.setParams({ regForm : RegForm });
        
        //create  a callback  that is  executed after
        //the server side returns
        action.setCallback(this, function(response){
          var state = response.getState();
        if(state === "SUCCESS"){
            
            //alert("From server: " + response.getReturnValue());
            cmp.set("v.isDataSubmitted",'True');
            var parseId = response.getReturnValue();
            cmp.set("v.RegistrationRecordId",parseId);
            
        }
            
        else if (state === "ERROR"){
            var errors = response.getError();
            if (errors){
                if (errors[0]  && errors[0].message	){
                    console.log("Error message: " + 
                               errors[0].message);
                    
                }
            } else {
                console.log("Unknown Error");
                }
                  
        }
        }  );
        
        $A.enqueueAction(action);             //$A.enqueueAction adds the serversideaction to the queue 
    },
    
    
    onClickCheckBox : function(component,evt,hlpr){
    console.log("this text is from controller Resource");
        hlpr.onClickCheckboxhelper(component);
},
   
    addDetails: function(cmp,evt,hlpr){
        console.log("Add Educational Details");
        var CurrentEducationdetailsList = cmp.get("v.EducationDetailsList");
        var CurrentSize = parseInt((CurrentEducationdetailsList.lenght));
        var NewSize = parseInt((CurrentSize.lenght) + 1);
        CurrentEducationdetailsList.push(NewSize);
        cmp.set("v.EducationDetailsList",CurrentEducationdetailsList);
    }
})