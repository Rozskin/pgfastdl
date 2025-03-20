#include <amxmodx>
#include <amxmisc>
#include <colorchat>

#define PLUGIN	"TimeLimit vote rus and colorchat"
#define AUTHOR	"modernized - wise"
#define VERSION	"0.7"

#define MAX_RESULTS 5

//thnx pr4er for help

new Float:g_timelimit
new menu

new g_voteCount[MAX_RESULTS + 1]
new g_tls[MAX_RESULTS]
new tls[MAX_RESULTS]

public plugin_init() 
{
	register_plugin(PLUGIN, VERSION, AUTHOR)
	
	new name[12], string[12]
	new multiplic = 20 // +++++
	
	for(new i=0;i<MAX_RESULTS;i++)
	{
		format(name, sizeof name -1, "amx_tl_%d", i+1)
		
		format(string, sizeof string -1, "%d", multiplic)
		
		tls[i] = register_cvar(name, string)
		
		multiplic += 10
	}
}

public plugin_cfg()
{
	menu = menu_create("\rСколько минут хотите играть на этой карте?", "menu_handler")
	
	for(new i=0;i<MAX_RESULTS;i++)
		g_tls[i] = get_pcvar_num(tls[i])
	
	set_task(180.0, "start_vote")
	
	build_menu()
}

build_menu()
{	
	new option[64], temp[12]
	for(new i=0;i<MAX_RESULTS;i++)
	{
		format(option, sizeof option -1, "\y%d \dМинут", g_tls[i])
		format(temp, sizeof temp -1, "%d", i+1)
		
		menu_additem(menu, option, temp, 0)
	}
	
	menu_setprop( menu, MPROP_EXIT, MEXIT_NEVER )
}

public start_vote(id)
{	
	new players[32], inum, i
	get_players(players, inum, "ch")
	
	for(i=0;i<inum;i++)
		menu_display(players[i], menu, 0)
	
	set_task(15.0, "finish_vote")
	
	for(i=1;i<(MAX_RESULTS+1);i++)
		g_voteCount[i] = 0
	
	return PLUGIN_CONTINUE
}

public menu_handler(id, menu, item)
{
	if( !is_user_connected( id ) )
		return PLUGIN_HANDLED 

	if(item == MENU_EXIT)
	{
		menu_cancel(id)
		
		return PLUGIN_HANDLED
	}
	
	new data[6], name[32]
	new access, callback
	
	menu_item_getinfo(menu, item, access, data, 5, "", 0, callback)
	
	new key = str_to_num(data)
	get_user_name(id, name, 31)
	
                                ColorChat(0,GREEN,"^1Игрок ^4%s ^1проголосовал за ^4%d ^1минут.", name, g_tls[key -1])
	
	g_voteCount[key]++
	
	menu_cancel(id)
	
	return PLUGIN_HANDLED
}

public finish_vote()
{
	g_timelimit = get_cvar_float("mp_timelimit")
	
	new best = 0, i
	
	for(i=0;i<(MAX_RESULTS+1);i++)
	{
		if(g_voteCount[i] > g_voteCount[best])
			best = i
	}
	
	new votesNum = 0
	for(i=0;i<(MAX_RESULTS+1);i++)
		votesNum += g_voteCount[i]
	
	new iRatio = votesNum ? floatround(get_cvar_float("amx_vote_ratio") * float(votesNum), floatround_ceil) : 1
	new iResult = g_voteCount[best]
	
	if(iResult >= iRatio)
	{
		new new_time = g_tls[best -1]
		
                                ColorChat(0,GREEN,"^3Голосование прошло успешно. ^1Будем играть ^4%d ^1минут.", new_time)
		
		set_cvar_num("mp_timelimit", new_time)
	}
	else
	{
                                ColorChat(0,GREEN,"^4Голосование неудачно.")
	}
	
	new players[32], inum
	get_players(players, inum, "ch")
	
	for(i=0;i<inum;i++)
		client_cmd(players[i], "slot10")
}

public plugin_end() 
{
	set_cvar_float("mp_timelimit", g_timelimit)
}
