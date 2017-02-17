local start   = os.clock();
local echo    = false;
local user    = 'administrator';

local intervale = timestamp.now () - 300;
local compare = 'nimts > '.. intervale;
local alarmHistory = alarm.history("where",compare);
local search = pairs; 
local upper = string.upper;

for _,v in search(alarmHistory) do
   local alarmTransaction = alarm.transactions(v.nimid);
   local i = 1;
   local backValue = nil;
   for _,j in search(alarmTransaction) do
       if j.assigned_to ~= nil then 
            if upper(j.assigned_to) == upper(user) then
                if backValue ~= nil then 
                    if backValue == 2 and j.type == 8 then 
                        action.assign('',v.nimid);
                    end
                end
                backValue = j.type; 
                if i == 2 then
                    backValue = nil;
                    break;
                end
                i = i + 1;
            end
        end
   end
end
print(string.format("elapsed time: %.2f\n", os.clock() - start));
