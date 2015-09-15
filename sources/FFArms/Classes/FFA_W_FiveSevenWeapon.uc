class FFA_W_FiveSevenWeapon extends P57LLI;

#exec OBJ LOAD FILE="FivesevenLLI_A.ukx"

defaultproperties
{
	MagCapacity=20
	Weight=1.000000
	ItemName="FN Five-seveN"
	Description="Five-seveN DESC"
	FireModeClass(0)=Class'FFArms.FFA_W_FiveSevenFire'
	PickupClass=Class'FFArms.FFA_W_FiveSevenPickup'
}