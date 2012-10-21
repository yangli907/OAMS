<cfcomponent output="false" alias="appmanage.cfcs.mvc.Edit_mail.mailaddrBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="pid" type="string" default="">
	<cfproperty name="fname" type="string" default="">
	<cfproperty name="lname" type="string" default="">
	<cfproperty name="email" type="string" default="">
	<cfproperty name="addr" type="string" default="">
	<cfproperty name="city" type="string" default="">
	<cfproperty name="state" type="string" default="">
	<cfproperty name="zip" type="string" default="">
	<cfproperty name="country" type="string" default="">
	<cfproperty name="decision" type="string" default="">
	<cfproperty name="progno" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.pid = "";
		variables.fname = "";
		variables.lname = "";
		variables.email = "";
		variables.addr = "";
		variables.city = "";
		variables.state = "";
		variables.zip = "";
		variables.country = "";
		variables.decision = "";
		variables.progno = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="mailaddrBean">
		<cfreturn this>
	</cffunction>
	<cffunction name="getId" output="false" access="public" returntype="any">
		<cfreturn variables.Id>
	</cffunction>

	<cffunction name="setId" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Id = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getPid" output="false" access="public" returntype="any">
		<cfreturn variables.Pid>
	</cffunction>

	<cffunction name="setPid" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Pid = arguments.val>
	</cffunction>

	<cffunction name="getFname" output="false" access="public" returntype="any">
		<cfreturn variables.Fname>
	</cffunction>

	<cffunction name="setFname" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Fname = arguments.val>
	</cffunction>

	<cffunction name="getLname" output="false" access="public" returntype="any">
		<cfreturn variables.Lname>
	</cffunction>

	<cffunction name="setLname" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Lname = arguments.val>
	</cffunction>

	<cffunction name="getEmail" output="false" access="public" returntype="any">
		<cfreturn variables.Email>
	</cffunction>

	<cffunction name="setEmail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Email = arguments.val>
	</cffunction>

	<cffunction name="getAddr" output="false" access="public" returntype="any">
		<cfreturn variables.Addr>
	</cffunction>

	<cffunction name="setAddr" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Addr = arguments.val>
	</cffunction>

	<cffunction name="getCity" output="false" access="public" returntype="any">
		<cfreturn variables.City>
	</cffunction>

	<cffunction name="setCity" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.City = arguments.val>
	</cffunction>

	<cffunction name="getState" output="false" access="public" returntype="any">
		<cfreturn variables.State>
	</cffunction>

	<cffunction name="setState" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.State = arguments.val>
	</cffunction>

	<cffunction name="getZip" output="false" access="public" returntype="any">
		<cfreturn variables.Zip>
	</cffunction>

	<cffunction name="setZip" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Zip = arguments.val>
	</cffunction>

	<cffunction name="getCountry" output="false" access="public" returntype="any">
		<cfreturn variables.Country>
	</cffunction>

	<cffunction name="setCountry" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Country = arguments.val>
	</cffunction>

	<cffunction name="getDecision" output="false" access="public" returntype="any">
		<cfreturn variables.Decision>
	</cffunction>

	<cffunction name="setDecision" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Decision = arguments.val>
	</cffunction>

	<cffunction name="getProgno" output="false" access="public" returntype="any">
		<cfreturn variables.Progno>
	</cffunction>

	<cffunction name="setProgno" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Progno = arguments.val>
	</cffunction>



</cfcomponent>