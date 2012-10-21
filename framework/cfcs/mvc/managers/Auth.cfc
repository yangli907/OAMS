<cfcomponent>

	<cffunction name="login" access="remote" returntype="any">
    	<cfargument name="user" required="true" />
        <cfargument name="pass" required="true" />
        <cfargument name="sgroup" required="true" />
		<cfquery name="qRead" datasource="appmanage">
			select *
			from users
            where email = <cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.user#" />
		</cfquery>
        
        <cfif qRead.pass EQ #arguments.pass#>
        	<cfreturn qRead>
        <cfelse>
        	<cfreturn false>
        </cfif>
	</cffunction>  

    
        
	<cffunction name="logout" access="remote" returntype="boolean">
		<cflogout>
		<cfreturn true>
	</cffunction>
	
	<cffunction name="sendPasswordReminder" access="remote" returntype="boolean">
		<!--- 
			use <cfmail> to send a password reminder email.
		--->
		<cfreturn true>
	</cffunction>
	
	<!---
		Should return error, if not a sucess.
	 --->
	<cffunction name="register" access="remote">
		<cfreturn true>
	</cffunction>	
	
</cfcomponent>