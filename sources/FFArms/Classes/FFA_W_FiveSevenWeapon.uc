class FFA_W_FiveSevenWeapon extends P57LLI;

#exec OBJ LOAD FILE="FivesevenLLI_A.ukx"

defaultproperties
{
	MagCapacity=20
	Weight=1.000000
	FireModeClass(0)=Class'FFArms.FFA_W_FiveSevenFire'
	FireModeClass(1)=Class'KFMod.NoFire'
	Description="Five-seveN DESC"
	PickupClass=Class'FFArms.FFA_W_FiveSevenPickup'
	AttachmentClass=Class'FFArms.FFA_W_FiveSevenAttachment'
	ItemName="FN Five-seveN"
}
