<cfcomponent output="false" alias="appmanage.cfcs.mvc.Edit_address.addressBean">
	<!---
		 These are properties that are exposed by this CFC object.
		 These property definitions are used when calling this CFC as a web services, 
		 passed back to a flash movie, or when generating documentation

		 NOTE: these cfproperty tags do not set any default property values.
	--->
	<cfproperty name="id" type="numeric" default="0">
	<cfproperty name="sid" type="numeric" default="0">
	<cfproperty name="address1" type="string" default="">
	<cfproperty name="address2" type="string" default="">
	<cfproperty name="city" type="string" default="">
	<cfproperty name="state" type="string" default="">
	<cfproperty name="country" type="string" default="">
	<cfproperty name="zip" type="string" default="">
	<cfproperty name="phone" type="string" default="">
	<cfproperty name="email" type="string" default="">

	<cfscript>
		//Initialize the CFC with the default properties values.
		variables.id = 0;
		variables.sid = 0;
		variables.address1 = "";
		variables.address2 = "";
		variables.city = "";
		variables.state = "";
		variables.country = "";
		variables.zip = "";
		variables.phone = "";
		variables.email = "";
	</cfscript>

	<cffunction name="init" output="false" returntype="addressBean">
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

	<cffunction name="getSid" output="false" access="public" returntype="any">
		<cfreturn variables.Sid>
	</cffunction>

	<cffunction name="setSid" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfif (IsNumeric(arguments.val)) OR (arguments.val EQ "")>
			<cfset variables.Sid = arguments.val>
		<cfelse>
			<cfthrow message="'#arguments.val#' is not a valid numeric"/>
		</cfif>
	</cffunction>

	<cffunction name="getAddress1" output="false" access="public" returntype="any">
		<cfreturn variables.Address1>
	</cffunction>

	<cffunction name="setAddress1" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Address1 = arguments.val>
	</cffunction>

	<cffunction name="getAddress2" output="false" access="public" returntype="any">
		<cfreturn variables.Address2>
	</cffunction>

	<cffunction name="setAddress2" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Address2 = arguments.val>
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

	<cffunction name="getCountry" output="false" access="public" returntype="any">
		<cfreturn variables.Country>
	</cffunction>

	<cffunction name="setCountry" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Country = arguments.val>
	</cffunction>

	<cffunction name="getZip" output="false" access="public" returntype="any">
		<cfreturn variables.Zip>
	</cffunction>

	<cffunction name="setZip" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Zip = arguments.val>
	</cffunction>

	<cffunction name="getPhone" output="false" access="public" returntype="any">
		<cfreturn variables.Phone>
	</cffunction>

	<cffunction name="setPhone" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Phone = arguments.val>
	</cffunction>

	<cffunction name="getEmail" output="false" access="public" returntype="any">
		<cfreturn variables.Email>
	</cffunction>

	<cffunction name="setEmail" output="false" access="public" returntype="void">
		<cfargument name="val" required="true">
		<cfset variables.Email = arguments.val>
	</cffunction>



</cfcomponent>