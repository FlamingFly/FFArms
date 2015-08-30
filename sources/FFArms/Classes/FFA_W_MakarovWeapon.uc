class FFA_W_MakarovWeapon extends PM;

#exec OBJ LOAD FILE="..\textures\PM_T.utx"
#exec OBJ LOAD FILE="..\Animations\PM_A.ukx"

defaultproperties
{
	MagCapacity=8
	Weight=1.000000
	FireModeClass(0)=Class'FFArms.FFA_W_MakarovFire'
	FireModeClass(1)=Class'KFMod.NoFire'
	Description="Makarov DESC"
	PickupClass=Class'FFArms.FFA_W_MakarovPickup'
	AttachmentClass=Class'FFArms.FFA_W_MakarovAttachment'
	ItemName="FFA Makarov"
}
