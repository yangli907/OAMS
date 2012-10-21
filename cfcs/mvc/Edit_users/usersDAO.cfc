<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="framework.cfcs.mvc.Edit_users.usersBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="appmanage">
			select 	id, first, last, email, phone,
					loc, grp, pass, admin, sgrp, 
					sgadmin
			from users
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "framework.cfcs.mvc.Edit_users.usersBean").init();
			obj.setid(qRead.id);
			obj.setfirst(qRead.first);
			obj.setlast(qRead.last);
			obj.setemail(qRead.email);
			obj.setphone(qRead.phone);
			obj.setloc(qRead.loc);
			obj.setgrp(qRead.grp);
			obj.setpass(qRead.pass);
			obj.setadmin(qRead.admin);
			obj.setsgrp(qRead.sgrp);
			obj.setsgadmin(qRead.sgadmin);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="framework.cfcs.mvc.Edit_users.usersBean">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getfirst()>
		<cfset var local2=arguments.bean.getlast()>
		<cfset var local3=arguments.bean.getemail()>
		<cfset var local4=arguments.bean.getphone()>
		<cfset var local6=arguments.bean.getloc()>
		<cfset var local7=arguments.bean.getgrp()>
		<cfset var local8=hash(arguments.bean.getpass(),"SHA")>
		<cfset var local9=arguments.bean.getadmin()>
		<cfset var local10=arguments.bean.getsgrp()>
		<cfset var local11=arguments.bean.getsgadmin()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="appmanage">
				insert into users(first, last, email, phone, loc, grp, pass, admin, sgrp, sgadmin)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_INTEGER" null="#iif((local7 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_INTEGER" null="#iif((local9 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="appmanage">
				select id
				from users
				where first = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and last = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and email = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and phone = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and loc = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and grp = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_INTEGER" null="#iif((local7 eq ""), de("yes"), de("no"))#" />
				  and pass = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and admin = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_INTEGER" null="#iif((local9 eq ""), de("yes"), de("no"))#" />
				  and sgrp = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_INTEGER" null="#iif((local10 eq ""), de("yes"), de("no"))#" />
				  and sgadmin = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_INTEGER" null="#iif((local11 eq ""), de("yes"), de("no"))#" />
				order by id desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setid(qGetID.id);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="framework.cfcs.mvc.Edit_users.usersBean">
		<cfset var qUpdate1="">
		<cfset var qUpdate2="">
        <cfset var pass="">
        
        <cfquery name="qUpdate1" datasource="appmanage" result="status">
			select pass
            from users
            where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
        </cfquery>
    
    	<cfif (qUpdate1.pass EQ arguments.bean.getpass())>
        	<cfset pass = arguments.bean.getpass()>
        <cfelse>
        	<cfset pass = hash(arguments.bean.getpass(),"SHA")>
        </cfif>

		<cfquery name="qUpdate2" datasource="appmanage" result="status">
			update users
			set first = <cfqueryparam value="#arguments.bean.getfirst()#" cfsqltype="CF_SQL_VARCHAR" />,
				last = <cfqueryparam value="#arguments.bean.getlast()#" cfsqltype="CF_SQL_VARCHAR" />,
				email = <cfqueryparam value="#arguments.bean.getemail()#" cfsqltype="CF_SQL_VARCHAR" />,
				phone = <cfqueryparam value="#arguments.bean.getphone()#" cfsqltype="CF_SQL_VARCHAR" />,
				loc = <cfqueryparam value="#arguments.bean.getloc()#" cfsqltype="CF_SQL_VARCHAR" />,
				grp = <cfqueryparam value="#arguments.bean.getgrp()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getgrp() eq ""), de("yes"), de("no"))#" />,
				pass = <cfqueryparam value="#pass#" cfsqltype="CF_SQL_VARCHAR" />,
				admin = <cfqueryparam value="#arguments.bean.getadmin()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getadmin() eq ""), de("yes"), de("no"))#" />,
				sgrp = <cfqueryparam value="#arguments.bean.getsgrp()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsgrp() eq ""), de("yes"), de("no"))#" />,
				sgadmin = <cfqueryparam value="#arguments.bean.getsgadmin()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsgadmin() eq ""), de("yes"), de("no"))#" />
			where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="framework.cfcs.mvc.Edit_users.usersBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="appmanage" result="status">
			delete
			from users
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>

	</cffunction>


</cfcomponent>