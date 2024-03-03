require("System\\ScriptDefine")
require("System\\ScriptReader")


BridgeFunctionTable = {}


function BridgeFunctionAttach(BridgeName,FunctionName)

	if BridgeName == "OnReadScript" then

		if BridgeFunctionTable[1] == nil then BridgeFunctionTable[1] = {} end
		table.insert(BridgeFunctionTable[1],{Function=FunctionName})

	elseif BridgeName == "OnShutScript" then

		if BridgeFunctionTable[2] == nil then BridgeFunctionTable[2] = {} end
		table.insert(BridgeFunctionTable[2],{Function=FunctionName})

	elseif BridgeName == "OnTimerThread" then

		if BridgeFunctionTable[3] == nil then BridgeFunctionTable[3] = {} end
		table.insert(BridgeFunctionTable[3],{Function=FunctionName})

	elseif BridgeName == "OnCommandManager" then

		if BridgeFunctionTable[4] == nil then BridgeFunctionTable[4] = {} end
		table.insert(BridgeFunctionTable[4],{Function=FunctionName})

	elseif BridgeName == "OnCharacterEntry" then

		if BridgeFunctionTable[5] == nil then BridgeFunctionTable[5] = {} end
		table.insert(BridgeFunctionTable[5],{Function=FunctionName})

	elseif BridgeName == "OnCharacterClose" then

		if BridgeFunctionTable[6] == nil then BridgeFunctionTable[6] = {} end
		table.insert(BridgeFunctionTable[6],{Function=FunctionName})

	elseif BridgeName == "OnNpcTalk" then

		if BridgeFunctionTable[7] == nil then BridgeFunctionTable[7] = {} end
		table.insert(BridgeFunctionTable[7],{Function=FunctionName})

	elseif BridgeName == "OnMonsterDie" then

		if BridgeFunctionTable[8] == nil then BridgeFunctionTable[8] = {} end
		table.insert(BridgeFunctionTable[8],{Function=FunctionName})

	elseif BridgeName == "OnUserDie" then

		if BridgeFunctionTable[9] == nil then BridgeFunctionTable[9] = {} end
		table.insert(BridgeFunctionTable[9],{Function=FunctionName})

	elseif BridgeName == "OnUserRespawn" then

		if BridgeFunctionTable[10] == nil then BridgeFunctionTable[10] = {} end
		table.insert(BridgeFunctionTable[10],{Function=FunctionName})

	elseif BridgeName == "OnCheckUserTarget" then

		if BridgeFunctionTable[11] == nil then BridgeFunctionTable[11] = {} end
		table.insert(BridgeFunctionTable[11],{Function=FunctionName})

	elseif BridgeName == "OnCheckUserKiller" then

		if BridgeFunctionTable[12] == nil then BridgeFunctionTable[12] = {} end
		table.insert(BridgeFunctionTable[12],{Function=FunctionName})

	elseif BridgeName == "OnPacketRecv" then

		if BridgeFunctionTable[13] == nil then BridgeFunctionTable[13] = {} end
		table.insert(BridgeFunctionTable[13],{Function=FunctionName})

	elseif BridgeName == "OnSQLAsyncResult" then

		if BridgeFunctionTable[14] == nil then BridgeFunctionTable[14] = {} end
		table.insert(BridgeFunctionTable[14],{Function=FunctionName})
	
	elseif BridgeName == "OnUserItemPick" then

		if BridgeFunctionTable[15] == nil then BridgeFunctionTable[15] = {} end
		table.insert(BridgeFunctionTable[15],{Function=FunctionName})
		
	elseif BridgeName == "OnUserItemDrop" then

		if BridgeFunctionTable[16] == nil then BridgeFunctionTable[16] = {} end
		table.insert(BridgeFunctionTable[16],{Function=FunctionName})
		
	elseif BridgeName == "OnUserItemMove" then

		if BridgeFunctionTable[17] == nil then BridgeFunctionTable[17] = {} end
		table.insert(BridgeFunctionTable[17],{Function=FunctionName})
		
	elseif BridgeName == "OnCommandDone" then

		if BridgeFunctionTable[18] == nil then BridgeFunctionTable[18] = {} end
		table.insert(BridgeFunctionTable[18],{Function=FunctionName})

	end

end


function BridgeFunction_OnReadScript()
	
	-- Load the DBI module
--local DBI = require("System\\DBI")

-- Create a connection
--local dbh = assert(DBI.Connect('MySQL', 'characters', 'root', 'M1d2m3', '127.0.0.1', 3306))

-- Set autocommit flag
--dbh:autocommit(true)

-- Check connection status
--local alive = dbh:ping()

-- Prepare an insert statement
--local insert = assert(dbh:prepare('insert into giant_mount_settings(character_id, giant_model, giant_status) values(?,?,?)'))

-- Execute the insert statement
--insert:execute(300, -1, -2)

-- Commit the transaction
--dbh:commit()

-- Close the prepared statement and connection handles
--insert:close()
--dbh:close()
	
	if BridgeFunctionTable[1] ~= nil then

		for n=1,#BridgeFunctionTable[1],1 do

			_G[BridgeFunctionTable[1][n].Function]()

		end

	end

end


function BridgeFunction_OnShutScript()

	if BridgeFunctionTable[2] ~= nil then

		for n=1,#BridgeFunctionTable[2],1 do

			_G[BridgeFunctionTable[2][n].Function]()

		end

	end

end


function BridgeFunction_OnTimerThread()

	if BridgeFunctionTable[3] ~= nil then

		for n=1,#BridgeFunctionTable[3],1 do

			_G[BridgeFunctionTable[3][n].Function]()

		end

	end

end


function BridgeFunction_OnCommandManager(aIndex,code,arg)

	if BridgeFunctionTable[4] ~= nil then

		for n=1,#BridgeFunctionTable[4],1 do

			local ret = _G[BridgeFunctionTable[4][n].Function](aIndex,code,arg)

			if ret ~= 0 then return 1 end

		end

	end

	return 0

end


function BridgeFunction_OnCharacterEntry(aIndex)

	if BridgeFunctionTable[5] ~= nil then

		for n=1,#BridgeFunctionTable[5],1 do

			_G[BridgeFunctionTable[5][n].Function](aIndex)

		end

	end

end


function BridgeFunction_OnCharacterClose(aIndex)

	if BridgeFunctionTable[6] ~= nil then

		for n=1,#BridgeFunctionTable[6],1 do

			_G[BridgeFunctionTable[6][n].Function](aIndex)

		end

	end

end


function BridgeFunction_OnNpcTalk(aIndex,bIndex)

	if BridgeFunctionTable[7] ~= nil then

		for n=1,#BridgeFunctionTable[7],1 do

			local ret = _G[BridgeFunctionTable[7][n].Function](aIndex,bIndex)

			if ret ~= 0 then return 1 end

		end

	end

	return 0

end


function BridgeFunction_OnMonsterDie(aIndex,bIndex)

	if BridgeFunctionTable[8] ~= nil then

		for n=1,#BridgeFunctionTable[8],1 do

			_G[BridgeFunctionTable[8][n].Function](aIndex,bIndex)

		end

	end

end


function BridgeFunction_OnUserDie(aIndex,bIndex)

	if BridgeFunctionTable[9] ~= nil then

		for n=1,#BridgeFunctionTable[9],1 do

			_G[BridgeFunctionTable[9][n].Function](aIndex,bIndex)

		end

	end

end


function BridgeFunction_OnUserRespawn(aIndex,KillerType)

	if BridgeFunctionTable[10] ~= nil then

		for n=1,#BridgeFunctionTable[10],1 do

			_G[BridgeFunctionTable[10][n].Function](aIndex,KillerType)

		end

	end

end


function BridgeFunction_OnCheckUserTarget(aIndex,bIndex)

	if BridgeFunctionTable[11] ~= nil then

		for n=1,#BridgeFunctionTable[11],1 do

			local ret = _G[BridgeFunctionTable[11][n].Function](aIndex,bIndex)

			if ret == 0 then return 0 end

		end

	end

	return 1

end


function BridgeFunction_OnCheckUserKiller(aIndex,bIndex)

	if BridgeFunctionTable[12] ~= nil then

		for n=1,#BridgeFunctionTable[12],1 do

			local ret = _G[BridgeFunctionTable[12][n].Function](aIndex,bIndex)

			if ret == 0 then return 0 end

		end

	end

	return 1

end


function BridgeFunction_OnPacketRecv(aIndex,buff,size)

	if BridgeFunctionTable[13] ~= nil then

		for n=1,#BridgeFunctionTable[13],1 do

			_G[BridgeFunctionTable[13][n].Function](aIndex,buff,size)

		end

	end

end


function BridgeFunction_OnSQLAsyncResult(label,param,result)

	if BridgeFunctionTable[14] ~= nil then

		for n=1,#BridgeFunctionTable[14],1 do

			local ret = _G[BridgeFunctionTable[14][n].Function](label,param,result)

			if ret == 1 then return 0 end

			if ret == 2 then return 1 end

		end

	end

	return 0

end

function BridgeFunction_OnUserItemPick(aIndex,bIndex)

	if BridgeFunctionTable[15] ~= nil then

		for n=1,#BridgeFunctionTable[15],1 do

			local ret = _G[BridgeFunctionTable[15][n].Function](aIndex,bIndex)

			if ret == 0 then return 0 end

		end

	end

	return 1

end

function BridgeFunction_OnUserItemDrop(aIndex, slot, x, y)

	if BridgeFunctionTable[16] ~= nil then

		for n=1,#BridgeFunctionTable[16],1 do

			local ret = _G[BridgeFunctionTable[16][n].Function](aIndex, slot, x, y)

			if ret == 0 then return 0 end

		end

	end

	return 1

end

function BridgeFunction_OnUserItemMove(aIndex, aFlag, aSlot, bFlag, bSlot)

	if BridgeFunctionTable[17] ~= nil then

		for n=1,#BridgeFunctionTable[17],1 do

			local ret = _G[BridgeFunctionTable[17][n].Function](aIndex, aFlag, aSlot, bFlag, bSlot)

			if ret == 0 then return 0 end

		end

	end

	return 1

end

function BridgeFunction_OnCommandDone(aIndex, code)

	if BridgeFunctionTable[18] ~= nil then

		for n=1,#BridgeFunctionTable[18],1 do

			local ret = _G[BridgeFunctionTable[18][n].Function](aIndex, code)

			if ret == 0 then return 0 end

		end

	end

	return 1

end

