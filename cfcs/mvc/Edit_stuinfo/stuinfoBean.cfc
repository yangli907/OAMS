<cfcomponent output="false" alias="appmanage.cfcs.mvc.Edit_stuinfo.stuinfoBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="pid" type="string" default="">
	<cfproperty name="lname" type="string" default="">
	<cfproperty name="fname" type="string" default="">
	<cfproperty name="gender" type="string" default="">
	<cfproperty name="dob" type="date" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.pid = "";
		variables.lname = "";
		variables.fname = "";
		variables.gender = "";
		variables.dob = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="stuinfoBean">
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

	<cffunction name="getLname" output="false" access="public" returntype="any">
		<cfreturn variables.Lname>
	</cffunction>

	<cffunction name="setLname" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Lname = arguments.val>
	</cffunction>

	<cffunction name="getFname" output="false" access="public" returntype="any">
		<cfreturn variables.Fname>
	</cffunction>

	<cffunction name="setFname" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Fname = arguments.val>
	</cffunction>

	<cffunction name="getGender" output="false" access="public" returntype="any">
		<cfreturn variables.Gender>
	</cffunction>

	<cffunction name="setGender" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Gender = arguments.val>
	</cffunction>

	<cffunction name="getDob" output="false" access="public" returntype="any">
		<cfreturn variables.Dob>
	</cffunction>

	<cffunction name="setDob" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsDate(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Dob = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid date"/>
		</cfif>
	</cffunction>



</cfcomponent>