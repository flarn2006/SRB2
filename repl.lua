if type(loadstring) ~= 'function' then
	error('loadstring is not a function. Are you running the correct SRB2 build?')
end

local function does_global_exist(key)
	if #key == 1 and 'a' <= key and key <= 'z' then
		return false --technically they do, but we'll pretend they don't for convenience sake
	else
		return _G[key] ~= nil
	end
end

local env
local env_meta = {
	_G=_G,       -- enable access to _G
	__index=_G,  -- enable reading global variables without _G
	__newindex=function(t,k,v)
		-- pass assignments to nonexistent values onto their global variables if present; otherwise save them in env
		if does_global_exist(k) then
			_G[k] = v
		else
			rawset(env, k, v)
		end
	end
}

local function reset_env()
	env = {out={}}
	setmetatable(env, env_meta)
end
reset_env()

local function print_error(text)
	print('\x85'..'ERROR: \x80'..text)
end

COM_AddCommand('lua', function(player, ...)
	local arg = ''
	for i,v in ipairs({...}) do
		if i == 1 then
			arg = $..' '
		end
		arg = $..v
	end

	local f = loadstring('return '..arg)
	if type(f) == 'string' then
		f = loadstring(arg)
		if type(f) == 'string' then
			print_error(f)
		end
	end

	env.p = player
	if type(f) == 'string' then print(f) end
	setfenv(f, env)
	local s,r = pcall(f)

	if s then
		if r ~= nil then
			table.insert(env.out, r)
			print('\x82out['..tostring(#env.out)..'] = \x80'..tostring(r)..'\x83 ('..type(r)..')')
		end
	else
		print_error(r)
	end
end, COM_LOCAL)

COM_AddCommand('lua_reset', reset_env, COM_LOCAL)
