<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="appmanage.cfcs.mvc.Edit_mail.mailaddrBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AppManage">
			select 	id, pid, fname, lname, email, addr, 
					city, state, zip, country, decision, 
					progno
			from mailaddr
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "appmanage.cfcs.mvc.Edit_mail.mailaddrBean").init();
			obj.setid(qRead.id);
			obj.setpid(qRead.pid);
			obj.setfname(qRead.fname);
			obj.setlname(qRead.lname);
			obj.setemail(qRead.email);
			obj.setaddr(qRead.addr);
			obj.setcity(qRead.city);
			obj.setstate(qRead.state);
			obj.setzip(qRead.zip);
			obj.setcountry(qRead.country);
			obj.setdecision(qRead.decision);
			obj.setprogno(qRead.progno);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_mail.mailaddrBean">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getpid()>
		<cfset var local2=arguments.bean.getfname()>
		<cfset var local3=arguments.bean.getlname()>
		<cfset var local4=arguments.bean.getemail()>
		<cfset var local5=arguments.bean.getaddr()>
		<cfset var local6=arguments.bean.getcity()>
		<cfset var local7=arguments.bean.getstate()>
		<cfset var local8=arguments.bean.getzip()>
		<cfset var local9=arguments.bean.getcountry()>
		<cfset var local10=arguments.bean.getdecision()>
		<cfset var local11=arguments.bean.getprogno()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="AppManage">
				insert into mailaddr(pid, fname, lname, email, addr, city, state, zip, country, decision, progno)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="AppManage">
				select id
				from mailaddr
				where pid = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_VARCHAR" />
				  and fname = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and lname = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and email = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and addr = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and city = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and state = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and zip = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and country = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				  and decision = <cfqueryparam value="#local10#" cfsqltype="CF_SQL_VARCHAR" />
				  and progno = <cfqueryparam value="#local11#" cfsqltype="CF_SQL_VARCHAR" />
				order by id desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setid(qGetID.id);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_mail.mailaddrBean">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AppManage" result="status">
			update mailaddr
			set pid = <cfqueryparam value="#arguments.bean.getpid()#" cfsqltype="CF_SQL_VARCHAR" />,
				fname = <cfqueryparam value="#arguments.bean.getfname()#" cfsqltype="CF_SQL_VARCHAR" />,
				lname = <cfqueryparam value="#arguments.bean.getlname()#" cfsqltype="CF_SQL_VARCHAR" />,
				email = <cfqueryparam value="#arguments.bean.getemail()#" cfsqltype="CF_SQL_VARCHAR" />,
				addr = <cfqueryparam value="#arguments.bean.getaddr()#" cfsqltype="CF_SQL_VARCHAR" />,
				city = <cfqueryparam value="#arguments.bean.getcity()#" cfsqltype="CF_SQL_VARCHAR" />,
				state = <cfqueryparam value="#arguments.bean.getstate()#" cfsqltype="CF_SQL_VARCHAR" />,
				zip = <cfqueryparam value="#arguments.bean.getzip()#" cfsqltype="CF_SQL_VARCHAR" />,
				country = <cfqueryparam value="#arguments.bean.getcountry()#" cfsqltype="CF_SQL_VARCHAR" />,
				decision = <cfqueryparam value="#arguments.bean.getdecision()#" cfsqltype="CF_SQL_VARCHAR" />,
				progno = <cfqueryparam value="#arguments.bean.getprogno()#" cfsqltype="CF_SQL_VARCHAR" />
			where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_mail.mailaddrBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AppManage" result="status">
			delete
			from mailaddr
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>

	</cffunction>


</cfcomponent>