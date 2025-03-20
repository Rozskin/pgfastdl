#include <amxmodx>
#include <fakemeta>
#include <hamsandwich>

#define m_flLastFireTime_Win32          79
#define m_flLastFireTime_LinuxDiff      4

public plugin_init() {
    register_plugin("Spray fix", "0.1", "");
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_ak47", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_aug", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Item_Deploy, "weapon_awp", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_awp", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_WeaponIdle, "weapon_c4", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_c4", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_deagle", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_elite", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_fiveseven", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_WeaponIdle, "weapon_flashbang", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_SecondaryAttack, "weapon_flashbang", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_g3sg1", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_glock18", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_WeaponIdle, "weapon_hegrenade", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_SecondaryAttack, "weapon_hegrenade", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_knife", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_SecondaryAttack, "weapon_knife", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_m249", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_m3", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_Reload, "weapon_m3", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_SecondaryAttack, "weapon_m4a1", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_m4a1", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_mac10", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_mp5navy", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_p228", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_p90", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Item_Deploy, "weapon_scout", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_scout", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_sg550", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_sg552", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_WeaponIdle, "weapon_smokegrenade", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_SecondaryAttack, "weapon_smokegrenade", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_tmp", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_ump45", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_SecondaryAttack, "weapon_usp", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_usp", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_famas", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_galil", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_PrimaryAttack, "weapon_xm1014", "BeforeGetNextAttackDelay", false);
    RegisterHam(Ham_Weapon_Reload, "weapon_xm1014", "BeforeGetNextAttackDelay", false);
}

public BeforeGetNextAttackDelay(const iEntity) {
     if (pev_valid(iEntity) == 2)
         set_pdata_float(iEntity, m_flLastFireTime_Win32, 0.0, m_flLastFireTime_LinuxDiff);
}
/* AMXX-Studio Notes - DO NOT MODIFY BELOW HERE
*{\\ rtf1\\ ansi\\ deff0{\\ fonttbl{\\ f0\\ fnil Tahoma;}}\n\\ viewkind4\\ uc1\\ pard\\ lang1033\\ f0\\ fs16 \n\\ par }
*/
