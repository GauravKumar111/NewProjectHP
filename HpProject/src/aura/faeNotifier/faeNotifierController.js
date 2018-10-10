({
    fireApplicationEvent : function(cmp, event) {
        // Get the application event by using the
        // e.<namespace>.<event> syntax
        var appEvent = $A.get("e.c:faeEvent");
        appEvent.setParams({
            "message" : "An application event fired me. " +
            "My First Application Event!" });
        appEvent.fire();
    }
})