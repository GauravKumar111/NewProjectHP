({
	onClickCheckboxhelper : function(cmp) {
		console.log("this text is from helper function");
         var checkBoxValue = cmp.find("checkBox").get("v.checked");
        cmp.set("v.CheckBoxValue",checkBoxValue);
        cmp.set("v.RegForm.Available_On_Weekends__c",checkBoxValue);
        
	}
})