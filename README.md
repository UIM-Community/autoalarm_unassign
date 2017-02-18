# autoalarm_unassign
CA UIM NAS Lua autoalarm_unassign

Unassign alarm when the severity of an alarm is changed. This ia an **AO script for NAS probe**.

## Configuration 

At the top of the lua script change these settings to debug or to change the focus user :

```lua
local echo    = false;
local user    = 'administrator';
```

if you dont want a specific user you have to update the script to delete the following condition : 

```lua
if upper(j.assigned_to) == user then

end
```
