<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="appmanage.cfcs.mvc.Edit_stuinfo.stuinfoBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AppManage">
			select 	id, pid, lname, fname, gender, dob
					
			from stuinfo
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "appmanage.cfcs.mvc.Edit_stuinfo.stuinfoBean").init();
			obj.setid(qRead.id);
			obj.setpid(qRead.pid);
			obj.setlname(qRead.lname);
			obj.setfname(qRead.fname);
			obj.setgender(qRead.gender);
			obj.setdob(qRead.dob);
			return obj;
		</cfscript>
	</cffunction>
	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_stuinfo.stuinfoBean">
		<cfargument name="id" required="false">
		<cfset var qCreate="">
		<cfset var qGetId="">
		<cfset var local1=arguments.bean.getpid()>
		<cfset var local2=arguments.bean.getlname()>
		<cfset var local3=arguments.bean.getfname()>
		<cfset var local4=arguments.bean.getgender()>
		<cfset var local5=arguments.bean.getdob()>
		<cfset var local6=arguments.bean.getid()>
		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="AppManage">
				insert into stuinfo(pid, lname, fname, gender, dob)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_DATE" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				)
			</cfquery>
			<cfquery name="qCreate" datasource="AppManage">
				insert into address(sid)
					select MAX(id) from stuinfo
			</cfquery>
			<cfquery name="qCreate" datasource="AppManage">
				insert into application(sid)
					select MAX(id) from stuinfo
			</cfquery>
			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="AppManage">
				select id
				from stuinfo
				where pid = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and lname = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and fname = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and gender = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and dob = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_DATE" null="#iif((local5 eq ""), de("yes"), de("no"))#" />
				order by id desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setid(qGetID.id);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_stuinfo.stuinfoBean">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AppManage" result="status">
			update stuinfo
			set pid = <cfqueryparam value="#arguments.bean.getpid()#" cfsqltype="CF_SQL_VARCHAR" />,
				lname = <cfqueryparam value="#arguments.bean.getlname()#" cfsqltype="CF_SQL_VARCHAR" />,
				fname = <cfqueryparam value="#arguments.bean.getfname()#" cfsqltype="CF_SQL_VARCHAR" />,
				gender = <cfqueryparam value="#arguments.bean.getgender()#" cfsqltype="CF_SQL_VARCHAR"/>,
				dob = <cfqueryparam value="#arguments.bean.getdob()#" cfsqltype="CF_SQL_DATE" null="#iif((arguments.bean.getdob() eq ""), de("yes"), de("no"))#" />
			where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_stuinfo.stuinfoBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AppManage" result="status">
			delete
			from stuinfo
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>

		<cfquery name="qDelete" datasource="AppManage" result="status">
			delete
			from address
			where sid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>
		
		<cfquery name="qDelete" datasource="AppManage" result="status">
			delete
			from application
			where sid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>
	</cffunction>


</cfcomponent>