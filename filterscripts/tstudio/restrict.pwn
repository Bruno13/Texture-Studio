new Iterator:Restriction[100]<MAX_PLAYERS>;

#define CanSelectObject(%0,%1) \ // playerid, object index (must be 0 or more than 50, if not it must be in a group with no restrictions, if not then the restriction must allow this player)
    (!(0 < ObjectData[%1][oGroup] <= 50) || !Iter_Count(Restriction[ObjectData[%1][oGroup]]) || Iter_Contains(Restriction[ObjectData[%1][oGroup]], playerid))

public OnFilterScriptInit()
{
	Iter_Init(Restriction);
    
	#if defined RS_OnFilterScriptInit
		RS_OnFilterScriptInit();
	#endif
	return 1;
}
#if defined _ALS_OnFilterScriptInit
	#undef OnFilterScriptInit
#else
	#define _ALS_OnFilterScriptInit
#endif
#define OnFilterScriptInit RS_OnFilterScriptInit
#if defined RS_OnFilterScriptInit
	forward RS_OnFilterScriptInit();
#endif

public OnPlayerDisconnect(playerid, reason)
{
	for(new g; g < 100; g++)
        Iter_Remove(Restriction[i], playerid);
    
	#if defined RS_OnPlayerDisconnect
		RS_OnPlayerDisconnect(playerid, reason);
	#endif
	return 1;
}
#if defined _ALS_OnPlayerDisconnect
	#undef OnPlayerDisconnect
#else
	#define _ALS_OnPlayerDisconnect
#endif
#define OnPlayerDisconnect RS_OnPlayerDisconnect
#if defined RS_OnPlayerDisconnect
	forward RS_OnPlayerDisconnect(playerid, reason);
#endif


