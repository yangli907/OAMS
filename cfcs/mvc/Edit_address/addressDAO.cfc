<cfcomponent output="false">

	<cffunction name="read" output="false" access="public" returntype="appmanage.cfcs.mvc.Edit_address.addressBean">
		<cfargument name="id" required="true">
		<cfset var qRead="">
		<cfset var obj="">

		<cfquery name="qRead" datasource="AppManage">
			select 	id, sid, address1, address2, city, state, 
					country, zip, phone, email
			from address
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.id#" />
		</cfquery>

		<cfscript>
			obj = createObject("component", "appmanage.cfcs.mvc.Edit_address.addressBean").init();
			obj.setid(qRead.id);
			obj.setsid(qRead.sid);
			obj.setaddress1(qRead.address1);
			obj.setaddress2(qRead.address2);
			obj.setcity(qRead.city);
			obj.setstate(qRead.state);
			obj.setcountry(qRead.country);
			obj.setzip(qRead.zip);
			obj.setphone(qRead.phone);
			obj.setemail(qRead.email);
			return obj;
		</cfscript>
	</cffunction>



	<cffunction name="create" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_address.addressBean">
		<cfset var qCreate="">

		<cfset var qGetId="">

		<cfset var local1=arguments.bean.getsid()>
		<cfset var local2=arguments.bean.getaddress1()>
		<cfset var local3=arguments.bean.getaddress2()>
		<cfset var local4=arguments.bean.getcity()>
		<cfset var local5=arguments.bean.getstate()>
		<cfset var local6=arguments.bean.getcountry()>
		<cfset var local7=arguments.bean.getzip()>
		<cfset var local8=arguments.bean.getphone()>
		<cfset var local9=arguments.bean.getemail()>

		<cftransaction isolation="read_committed">
			<cfquery name="qCreate" datasource="AppManage">
				insert into address(sid, address1, address2, city, state, country, zip, phone, email)
				values (
					<cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />,
					<cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />,
					<cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				)
			</cfquery>

			<!--- If your server has a better way to get the ID that is more reliable, use that instead --->
			<cfquery name="qGetID" datasource="AppManage">
				select id
				from address
				where sid = <cfqueryparam value="#local1#" cfsqltype="CF_SQL_INTEGER" null="#iif((local1 eq ""), de("yes"), de("no"))#" />
				  and address1 = <cfqueryparam value="#local2#" cfsqltype="CF_SQL_VARCHAR" />
				  and address2 = <cfqueryparam value="#local3#" cfsqltype="CF_SQL_VARCHAR" />
				  and city = <cfqueryparam value="#local4#" cfsqltype="CF_SQL_VARCHAR" />
				  and state = <cfqueryparam value="#local5#" cfsqltype="CF_SQL_VARCHAR" />
				  and country = <cfqueryparam value="#local6#" cfsqltype="CF_SQL_VARCHAR" />
				  and zip = <cfqueryparam value="#local7#" cfsqltype="CF_SQL_VARCHAR" />
				  and phone = <cfqueryparam value="#local8#" cfsqltype="CF_SQL_VARCHAR" />
				  and email = <cfqueryparam value="#local9#" cfsqltype="CF_SQL_VARCHAR" />
				order by id desc
			</cfquery>
		</cftransaction>

		<cfscript>
			arguments.bean.setid(qGetID.id);
		</cfscript>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="update" output="false" access="public">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_address.addressBean">
		<cfset var qUpdate="">

		<cfquery name="qUpdate" datasource="AppManage" result="status">
			update address
			set sid = <cfqueryparam value="#arguments.bean.getsid()#" cfsqltype="CF_SQL_INTEGER" null="#iif((arguments.bean.getsid() eq ""), de("yes"), de("no"))#" />,
				address1 = <cfqueryparam value="#arguments.bean.getaddress1()#" cfsqltype="CF_SQL_VARCHAR" />,
				address2 = <cfqueryparam value="#arguments.bean.getaddress2()#" cfsqltype="CF_SQL_VARCHAR" />,
				city = <cfqueryparam value="#arguments.bean.getcity()#" cfsqltype="CF_SQL_VARCHAR" />,
				state = <cfqueryparam value="#arguments.bean.getstate()#" cfsqltype="CF_SQL_VARCHAR" />,
				country = <cfqueryparam value="#arguments.bean.getcountry()#" cfsqltype="CF_SQL_VARCHAR" />,
				zip = <cfqueryparam value="#arguments.bean.getzip()#" cfsqltype="CF_SQL_VARCHAR" />,
				phone = <cfqueryparam value="#arguments.bean.getphone()#" cfsqltype="CF_SQL_VARCHAR" />,
				email = <cfqueryparam value="#arguments.bean.getemail()#" cfsqltype="CF_SQL_VARCHAR" />
			where id = <cfqueryparam value="#arguments.bean.getid()#" cfsqltype="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn arguments.bean />
	</cffunction>



	<cffunction name="delete" output="false" access="public" returntype="void">
		<cfargument name="bean" required="true" type="appmanage.cfcs.mvc.Edit_address.addressBean">
		<cfset var qDelete="">

		<cfquery name="qDelete" datasource="AppManage" result="status">
			delete
			from address
			where id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.bean.getid()#" />
		</cfquery>

	</cffunction>


</cfcomponent>